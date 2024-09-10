create database Project3;
select * from synthetic_stock_data;

-- KPI 1 Average Daily Trading Volume
select ticker , concat(round(avg(volume)/1000,1),"K") as "Avg Daily Volume" from synthetic_stock_data group by ticker order by Avg(volume) desc ;

-- KPI 2 Most Volatile Stocks
select ticker,ROund(sum(Beta),2) as volatality from synthetic_stock_data group by ticker order by sum(beta) desc;

-- KPI 3 Stocks with Highest and Lowest Dividend
select ticker , sum(Dividend_Amount) as "Total Divident Amount" from synthetic_stock_data group by ticker order by Sum(Dividend_Amount) desc ;

-- KPI 4 Highest and Lowest PE ratios
select ticker, max(PE_ratio) as "Max PE Ratio" from synthetic_stock_data group by ticker order by max(PE_Ratio) desc;
select ticker, min(PE_ratio) As "Min PE Ratio" from synthetic_stock_data group by ticker order by min(PE_Ratio);

-- KPI 5 Stocks with Highest Market Cap
select ticker,concat(round(sum(Market_Cap)/1000000000,2)," B") as "Total Market Cap" from synthetic_stock_data group by ticker order by sum(Market_Cap) desc ;

-- KPI 6 Stocks Near 52 Week High
select ticker, max(52_Week_High) from synthetic_stock_data group by ticker;

-- KPI 7 Stocks Near 52 Week Low
select ticker,min(52_Week_Low)  from synthetic_stock_data group by ticker;

-- KPI 8 'Stocks with Strong Buy Signals and stocks with Strong Selling Signal
select ticker, concat(round(sum(volume)/1000000000,2), " B") as "Total Volume" from synthetic_stock_data where macd > 0 and RSI < 45 group by ticker order by sum(volume) desc;
select ticker, concat(round(sum(volume)/1000000000,2), " B") as "Total Volume" from synthetic_stock_data where macd < 0 and RSI > 68 group by ticker order by sum(volume) desc ;