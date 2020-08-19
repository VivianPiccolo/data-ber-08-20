1. From the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? Show the results sorted by district_id in ascending order.

SELECT
		district_id,
        COUNT(client_ID)
FROM bank.client
GROUP BY district_id
order by district_id ASC

Result:

1	663	
2	46	
3	63	
4	50	
5	71	
6	53	
7	45	
8	69	
9	60

2. From the card table, how many cards exist for each type? Rank the result starting with the most frequent type.

SELECT
		type,
        COUNT(card_id)
FROM bank.card
GROUP BY type
order by type ASC

Result:
classic	659	
junior	145	
gold	88

3. Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.

SELECT
		account_id,
        SUM(amount)
FROM bank.LOAN
GROUP BY account_id
order by amount DESC
limit 10;


Result:
7542	590820	
8926	566640	
2335	541200	
817	538500	
2936	504000	
7049	495180	
10451	482940	
6950	475680	
7966	473280	
339	468060

4. From the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order
date not fully WORKING
SELECT
		date,
        count(DISTINCT loan_id)			AS total_loan_id
FROM bank.LOAN
WHERE date < 970907
GROUP BY date
order by date ASC

Result:

930906	1	
930803	1	
930728	1	
930711	1	
930705	1
5. From the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration, ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.
date not fully WORKING
SELECT
		date,
        count(DISTINCT loan_id)			AS total_loan_id, 
        duration
FROM bank.LOAN
WHERE date >= 971201 AND date < 9712231
GROUP BY date,
		duration
order by date ASC,
		duration ASC	



Result:
971206	24	1	
971206	36	1	
971208	12	3	
971209	12	1	
971209	24	1	
971210	12	1	
971211	24	1	
971211	48	1	
971213	24	1	
971220	36	1	
971221	36	1	
971224	60	1	
971225	24	1	
971225	60	1	

6. From the trans table, for account_id 396, sum the amount of transactions for each type (VYDAJ = Outgoing, PRIJEM = Incoming). Your output should have the account_id, the type and the sum of amount, named as total_amount. Sort alphabetically by type.
Result:

SELECT
		account_id,
        type,
        SUM(amount)		AS total_amount
FROM bank.trans
WHERE product_id = '396'
group by type


396	PRIJEM	1028138.6999740601	
396	VYDAJ	1485814.400024414
7. From the previous output, translate the values for type to English, rename the column to transaction_type, round total_amount down to an integer
Result:

396	INCOMING	1028138	
396	OUTGOING	1485814
8. From the previous result, modify you query so that it returns only one row, with a column for incoming amount, outgoing amount and the difference
Result:

396	1028138	1485814	-457676
9. Continuing with the previous example, rank the top 10 account_ids based on their difference
Result:

9707	869527	
3424	816372	
3260	803055	
2486	735219	
1801	725382	
4470	707243	
3674	703531	
9656	702786	
2227	696564	
6473	692580