-- Bank Loan Analysis Project --


use bank_analysis;

# Year wise loan amount Stats

select year(issue_d) as Year_of_issue_D,
       sum(loan_amnt) as Toatl_loan_amount 
       from finance_1 
       group by  Year_of_issue_D
       order by  Year_of_issue_D;
       
       
       # Grade and sub grade wise revol_bal

select 
      grade , sub_grade,sum(revol_bal) as Toatl_Revol_Bal 
      from finance_1 inner join finance_2 
      on (finance_1.id = finance_2.id)
      group by grade , sub_grade;
      
      
      
      # Total Payment for Verified Status Vs Total Payment for Non Verified Status

select 
      verification_status,
      concat("$",FORMAT(ROUND(SUM(total_pymnt)/10000,2),2), "m") as Total_Payment 
      from 
            finance_1 inner join finance_2 
		on  (finance_1.id = finance_2.id) 
        group by verification_status
        order by verification_status;
        
        
#State wise and month wise loan status

select         
       addr_state , last_credit_pull_d , loan_status
       from 
            finance_1 inner join finance_2 
		on  (finance_1.id = finance_2.id) 
        group by addr_state , last_credit_pull_d , loan_status
        order by last_credit_pull_d; 
        
        
        
  #      Home ownership Vs last payment date stats
  
        
SELECT 
    home_ownership, 
    last_pymnt_d,
    CONCAT('$', FORMAT(ROUND(SUM(last_pymnt_amnt) / 1000, 2), 2), 'k') AS Total_Amount
FROM 
    finance_1 
INNER JOIN 
    finance_2 ON finance_1.id = finance_2.id
GROUP BY 
    home_ownership, last_pymnt_d
ORDER BY 
    last_pymnt_d DESC, home_ownership DESC;
            
            
            
            
        