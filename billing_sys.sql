CREATE PROCEDURE   calculateDomesticBill(
    IN units INT,
    OUT billAmount Double
)
BEGIN
    DECLARE bill DOUBLE DEFAULT 0.0;
    DECLARE fixedCharge DOUBLE DEFAULT 0.0;
    DECLARE totalUnits DOUBLE;
    DECLARE remainingUnits DOUBLE;

    SET totalUnits = units;

    IF totalUnits <= 30 THEN
        SET bill = totalUnits * 8.0;
        SET fixedCharge = 150.0;
    ELSEIF totalUnits <= 60 THEN
        SET bill = 30 * 8.0 + (totalUnits - 30) * 20.0;
        SET fixedCharge = 300.0;
    ELSE
        SET remainingUnits = totalUnits - 60;
        SET bill = 30 * 8.0 + 30 * 20.0;

        IF remainingUnits <= 30 THEN
            SET bill = bill + remainingUnits * 25.0;
        ELSEIF remainingUnits <= 60 THEN
            SET bill = bill + 30 * 25.0 + (remainingUnits - 30) * 30.0;
            SET fixedCharge = 400.0;
        ELSEIF remainingUnits <= 120 THEN
            SET bill = bill + 30 * 25.0 + 30 * 30.0 + (remainingUnits - 60) * 50.0;
            SET fixedCharge = 1000.0;
        ELSEIF remainingUnits <= 180 THEN
            SET bill = bill + 30 * 25.0 + 30 * 30.0 + 60 * 50.0 + (remainingUnits - 120) * 50.0;
            SET fixedCharge = 1500.0;
        ELSE
            SET bill = bill + 30 * 25.0 + 30 * 30.0 + 60 * 50.0 + 60 * 50.0 + (remainingUnits - 180) * 75.0;
            SET fixedCharge = 2000.0;
        END IF;
    END IF;


    SET billAmount = (bill + fixedCharge) * 1.025;
END;


CREATE PROCEDURE calculateDomesticWaterBill(
    IN units INT,
    OUT billAmount DOUBLE
)
BEGIN
   DECLARE bill DOUBLE DEFAULT 0.0;
   DECLARE fixedCharge DOUBLE DEFAULT 0.0;

   IF units <= 5 THEN
        SET bill = units * 60.0;
        SET fixedCharge = 300.0;
    ELSEIF units <= 10 THEN
        SET bill = 5 * 60.0 + (units - 5) * 80.0;
        SET fixedCharge = 300.0;
    ELSEIF units <= 15 THEN
        SET bill = 5 * 60.0 + 5 * 80.0 + (units - 10) * 100.0;
        SET fixedCharge = 300.0;
    ELSEIF units <= 20 THEN
        SET bill = 5 * 60.0 + 5 * 80.0 + 5 * 100.0 + (units - 15) * 110.0;
        SET fixedCharge = 400.0;
    ELSEIF units <= 25 THEN
        SET bill = 5 * 60.0 + 5 * 80.0 + 5 * 100.0 + 5 * 110.0 + (units - 20) * 130.0;
        SET fixedCharge = 500.0;
    ELSEIF units <= 30 THEN
        SET bill = 5 * 60.0 + 5 * 80.0 + 5 * 100.0 + 5 * 110.0 + 5 * 130.0 + (units - 25) * 160.0;
        SET fixedCharge = 600.0;
    ELSEIF units <= 40 THEN
        SET bill = 5 * 60.0 + 5 * 80.0 + 5 * 100.0 + 5 * 110.0 + 5 * 130.0 + 5 * 160.0 + (units - 30) * 180.0;
        SET fixedCharge = 1500.0;
    ELSEIF units <= 50 THEN
        SET bill = 5 * 60.0 + 5 * 80.0 + 5 * 100.0 + 5 * 110.0 + 5 * 130.0 + 5 * 160.0 + 10 * 180.0 + (units - 40) * 210.0;
        SET fixedCharge = 3000.0;
    ELSEIF units <= 75 THEN
        SET bill = 5 * 60.0 + 5 * 80.0 + 5 * 100.0 + 5 * 110.0 + 5 * 130.0 + 5 * 160.0 + 10 * 180.0 + 10 * 210.0 + (units - 50) * 240.0;
        SET fixedCharge = 3500.0;
    ELSEIF units <= 100 THEN
        SET bill = 5 * 60.0 + 5 * 80.0 + 5 * 100.0 + 5 * 110.0 + 5 * 130.0 + 5 * 160.0 + 10 * 180.0 + 10 * 210.0 + 25 * 230.0 + (units - 75) * 270.0;
        SET fixedCharge = 4000.0;
    ELSE
        SET bill = 5 * 60.0 + 5 * 80.0 + 5 * 100.0 + 5 * 110.0 + 5 * 130.0 + 5 * 160.0 + 10 * 180.0 + 10 * 210.0 + 25 * 230.0 + 25 * 270.0 + (units - 100) * 300.0;
        SET fixedCharge = 4500.0;
    END IF;

    SET billAmount = (bill + fixedCharge) * 1.18;
END;
