# smart_contracts

## About

This project features 3 smart contracts:
- Associate Profit Splitter 
    
    `equally splits a set amount among a set number of employees`
- Tiered Profit Splitter 

    `splits a set amount into portions by employee tier`
- Deferred Equity Plan 
    
    `company shares incentive by years in company, to be dispersed at 1 year intervals`
    `can be activated/deactivated by HR or employee`
---

## Basics

Associate Profit Splitter & Tiered Profit Splitter
    
    Variables
    
        - 3 payable addresses for employees; will be input into constructor function

    Functions
    
        - to show balance (proves money isn't going into smart contract and just distributed straight to the employees)

        - to deposit the amount that is distributed

            - Tiered is split unevenly based on a 100 point system (higher % = higher pay)

            - Associate is evenly split divided by the number of employees

            - leftover currency is returned to the person depositing

        - external payable to prevent accidental deposits

Deferred Equity Plan

    Variables

        - address for HR and `payable` employee

        - uint for total shares, annual distribution, `public` distributed shares, start time, and unlock time (fakenow for testing)

        - bool for active (contract can be active/inactive)

    Functions
        - constructor for HR and employee
        - distribute shares
            - requires HR or employee use for successful interaction
            - requires active contract
        - deactivate renders contract's distribute fx unusable; also requires HR or employee
        -external payable to prevent ether from being sent to contract, it is meant to dist shares so no ether should be involved here

---
## Deployment & Use


### Local Testing

Associate Profit Splitter

![](/Resources/AssociateProfitSplitter.gif)
---

Tiered Profit Splitter
![](/Resources/TieredProfitSplitter.gif)
---
Deferred Equity 
![](/Resources/DeferredEquityPlan.gif)
---
