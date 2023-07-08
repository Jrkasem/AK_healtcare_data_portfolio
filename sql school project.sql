--school project in sql to calculations for likelihood ratios
-- Create a temporary table and populate it with your data
CREATE TABLE #ICD
(
    Condition varchar(10),
    TP int, -- True Positive
    FP int, -- False Positive
    FN int, -- False Negative
    TN int  -- True Negative
);

INSERT INTO #ICD (Condition, TP, FP, FN, TN)
VALUES
('I291', 150, 172, 300, 1284),
('I323', 223, 98, 0, 2561),
('I289', 0, 283, 274, 671),
('I306', 194, 671, 169, 1089),
('I345', 387, 149, 459, 2651),
('I359', 143, 387, 732, 890),
('I111', 0, 2063, 0, 763),
('I135', 691, 1045, 564, 4971),
('I194', 231, 894, 493, 3200),
('I491', 572, 1045, 873, 1100);

-- Perform the calculations for likelihood ratios
SELECT 
    Condition,
    (1.0 * TP) / NULLIF((TP + FN), 0) AS Sensitivity,
    (1.0 * TN) / NULLIF((TN + FP), 0) AS Specificity,
    CASE
        WHEN TP + FN = 0 OR TN + FP = 0 THEN NULL
        ELSE ((1.0 * TP) / (TP + FN)) / (1 - ((1.0 * TN) / (TN + FP)))
    END AS LR_Plus,
    CASE
        WHEN TP + FN = 0 OR TN + FP = 0 THEN NULL
        ELSE ((1 - (1.0 * TP) / (TP + FN))) / ((1.0 * TN) / (TN + FP))
    END AS LR_Minus
FROM 
    #ICD;

DROP TABLE #ICD;
