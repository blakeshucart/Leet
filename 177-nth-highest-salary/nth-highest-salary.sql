CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN

    RETURN (
        SELECT MIN(salary)
        FROM (
            SELECT DENSE_RANK() OVER (ORDER BY salary DESC) AS salRank, salary
            FROM Employee
        ) AS ranked
        WHERE salRank = @N
    );
END