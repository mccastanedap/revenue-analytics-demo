
-- models/fct_revenue.sql
-- dbt-style model joining customers and revenue into a month-grained fact table.
-- Downstream models can aggregate to compute MRR, ARR, churn, expansion, contraction, NRR, etc.

with customers as (
    select *
    from {{ ref('customers') }}
),

revenue as (
    select *
    from {{ ref('revenue') }}
),

base as (
    select
        r.customer_id,
        r.month::date as month,
        r.mrr::numeric as mrr,
        c.segment,
        c.region,
        c.plan_tier,
        c.acquisition_channel,
        c.start_date::date as start_date,
        c.churned,
        c.churn_date::date as churn_date,
        case
            when c.churned = 1 and date_trunc('month', c.churn_date) = date_trunc('month', r.month) then 1
            else 0
        end as is_churn_month,
        case
            when r.month >= c.start_date and (c.churn_date is null or r.month <= c.churn_date) then 1
            else 0
        end as is_active
    from revenue r
    join customers c on c.customer_id = r.customer_id
),

with_changes as (
    select
        b.*,
        lag(b.mrr) over (partition by b.customer_id order by b.month) as prev_mrr,
        (b.mrr - lag(b.mrr) over (partition by b.customer_id order by b.month)) as mrr_delta
    from base b
),

classified as (
    select
        *,
        case
            when is_churn_month = 1 then 'churn'
            when mrr_delta > 0 then 'expansion'
            when mrr_delta < 0 then 'contraction'
            else 'flat'
        end as revenue_change_type,
        (mrr * 12.0) as arr
    from with_changes
)

select * from classified
