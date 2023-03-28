-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Ms1AjL
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Wine tables

CREATE TABLE "Wines" (
    "wine_id" serial   NOT NULL,
    "brand_id" int   NOT NULL,
    "vintage_id" int   NOT NULL,
    "rating" float   NOT NULL,
    "num_ratings" int   NOT NULL,
    "price" float   NOT NULL,
    "region_id" int   NOT NULL,
    "country_id" int   NOT NULL,
    "year" int   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_Wines" PRIMARY KEY (
        "wine_id"
     )
);

CREATE TABLE "Brand" (
    "brand_id" serial   NOT NULL,
    "brand_name" varchar(50)   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_Brand" PRIMARY KEY (
        "brand_id"
     )
);

CREATE TABLE "Vintage" (
    "vintage_id" serial   NOT NULL,
    "vintage_name" varchar(80)   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_Vintage" PRIMARY KEY (
        "vintage_id"
     )
);

CREATE TABLE "Region" (
    "region_id" serial   NOT NULL,
    "region" varchar(60)   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "region_id"
     )
);

CREATE TABLE "Country" (
    "country_id" serial   NOT NULL,
    "country" varchar(20)   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_Country" PRIMARY KEY (
        "country_id"
     )
);

ALTER TABLE "Wines" ADD CONSTRAINT "fk_Wines_brand_id" FOREIGN KEY("brand_id")
REFERENCES "Brand" ("brand_id");

ALTER TABLE "Wines" ADD CONSTRAINT "fk_Wines_vintage_id" FOREIGN KEY("vintage_id")
REFERENCES "Vintage" ("vintage_id");

ALTER TABLE "Wines" ADD CONSTRAINT "fk_Wines_region_id" FOREIGN KEY("region_id")
REFERENCES "Region" ("region_id");

ALTER TABLE "Wines" ADD CONSTRAINT "fk_Wines_country_id" FOREIGN KEY("country_id")
REFERENCES "Country" ("country_id");

