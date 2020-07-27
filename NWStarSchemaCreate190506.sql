CREATE SCHEMA "Northwind"
    AUTHORIZATION postgres;
    

CREATE TABLE "Northwind"."DimTime"
(
    "OrderID" INTEGER PRIMARY KEY,
    "OrderDate" DATE,
    "Year" INTEGER,
    "Month" CHARACTER VARYING
)
WITH (
    OIDS = FALSE
);

ALTER TABLE "Northwind"."DimTime"
    OWNER to postgres;

CREATE TABLE "Northwind"."DimProduct"
(
    "ProdID" INTEGER PRIMARY KEY,
    "ProdName" CHARACTER VARYING,
    "Category" CHARACTER VARYING,
    "UnitPrice" MONEY
)
WITH (
    OIDS = FALSE
);

ALTER TABLE "Northwind"."DimProduct"
    OWNER to postgres;
    
CREATE TABLE "Northwind"."DimCustomer"
(
    "CustID" INTEGER PRIMARY KEY,
    "CustName" CHARACTER VARYING,
    "CustAddress" CHARACTER VARYING,
    "City" CHARACTER VARYING,
    "Zip" INTEGER
)
WITH (
    OIDS = FALSE
);

ALTER TABLE "Northwind"."DimCustomer"
    OWNER to postgres;

CREATE TABLE "Northwind"."DimEmployee"
(
    "EmpID" INTEGER PRIMARY KEY,
    "EmpName" CHARACTER VARYING,
    "Title" CHARACTER VARYING,
    "Department" CHARACTER VARYING,
    "Region" CHARACTER VARYING
)
WITH (
    OIDS = FALSE
);

ALTER TABLE "Northwind"."DimEmployee"
    OWNER to postgres; 
     
CREATE TABLE "Northwind"."FctSales"
(
    "SalesProdID" INTEGER,
    "SalesOrderID" INTEGER,
    "SalesCustID" INTEGER,
    "SalesEmpID" INTEGER,
    "Total" MONEY,
    "Quantity" INTEGER,
    "SalesID" SERIAL PRIMARY KEY
)
WITH (
    OIDS = FALSE
);

ALTER TABLE "Northwind"."FctSales"
    OWNER to postgres;
    

ALTER TABLE "Northwind"."FctSales"
    ADD CONSTRAINT "fk_dimTime" FOREIGN kEY ("SalesOrderID")
    REFERENCES "Northwind"."DimTime" ("OrderID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE "Northwind"."FctSales"
    ADD CONSTRAINT "fk_dimProd" FOREIGN kEY ("SalesProdID")
    REFERENCES "Northwind"."DimProduct" ("ProdID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
    
ALTER TABLE "Northwind"."FctSales"
    ADD CONSTRAINT "fk_dimCust" FOREIGN kEY ("SalesCustID")
    REFERENCES "Northwind"."DimCustomer" ("CustID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
    
ALTER TABLE "Northwind"."FctSales"
    ADD CONSTRAINT "fk_dimEmp" FOREIGN kEY ("SalesEmpID")
    REFERENCES "Northwind"."DimEmployee" ("EmpID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;