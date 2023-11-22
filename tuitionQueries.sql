SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[UndergradTuitionByFieldofStudy]
 ORDER BY REF_DATE, GEO

SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[GraduateTuitionByFieldofStudy]
 ORDER BY REF_DATE, GEO

SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[UndergradTuitionByFieldofStudy_InternationalStudents]
 ORDER BY REF_DATE, GEO

SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[GraduateTuitionByFieldofStudy_InternationalStudents]
 ORDER BY REF_DATE, GEO

--- UNDERGRADUATE DOMESTIC TUITION DATA BY COUNTRY ONLY (NO NULLS)
SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[UndergradTuitionByFieldofStudy]
 WHERE GEO = 'Canada' AND VALUE IS NOT NULL
 ORDER BY REF_DATE, GEO --- 334 VALUES

SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[UndergradTuitionByFieldofStudy]
 WHERE GEO = 'Canada' AND VALUE IS NULL
 ORDER BY REF_DATE, GEO --- 2 NULL VALUES

--- UNDERGRADUATE DOMESTIC TUITION DATA BY PROVINCE (NO NULLS)
SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[UndergradTuitionByFieldofStudy]
 WHERE GEO != 'Canada' AND VALUE IS NOT NULL
 ORDER BY REF_DATE, GEO --- 2930 VALUES

SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[UndergradTuitionByFieldofStudy]
 WHERE GEO != 'Canada' AND VALUE IS NULL
 ORDER BY REF_DATE, GEO --- 293 VALUES

--- GRADUATE DOMESTIC TUITION DATA BY COUNTRY ONLY
SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[GraduateTuitionByFieldofStudy]
 WHERE GEO = 'Canada' AND VALUE IS NOT NULL
 ORDER BY REF_DATE, GEO --- 352 VALUES

SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[GraduateTuitionByFieldofStudy]
 WHERE GEO = 'Canada' AND VALUE IS NULL
 ORDER BY REF_DATE, GEO --- 16 NULL VALUES

--- GRADUATE DOMESTIC TUITION DATA BY PROVINCE
SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[GraduateTuitionByFieldofStudy]
 WHERE GEO != 'Canada' AND VALUE IS NOT NULL
 ORDER BY REF_DATE, GEO --- 2830 VALUES

SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[GraduateTuitionByFieldofStudy]
 WHERE GEO != 'Canada' AND VALUE IS NULL
 ORDER BY REF_DATE, GEO --- 547 VALUES

--- UNDERGRADUATE INTERNATIONAL TUITION DATA BY COUNTRY ONLY
SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[UndergradTuitionByFieldofStudy_InternationalStudents]
 WHERE GEO = 'Canada' AND VALUE IS NOT NULL
 ORDER BY REF_DATE, GEO --- 330 VALUES

SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[UndergradTuitionByFieldofStudy_InternationalStudents]
 WHERE GEO = 'Canada' AND VALUE IS NULL
 ORDER BY REF_DATE, GEO --- 0 NULL VALUES

--- UNDERGRADUATE INTERNATIONAL TUITION DATA BY PROVINCE
SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[UndergradTuitionByFieldofStudy_InternationalStudents]
 WHERE GEO != 'Canada' AND VALUE IS NOT NULL
 ORDER BY REF_DATE, GEO --- 2625 VALUES

SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[UndergradTuitionByFieldofStudy_InternationalStudents]
 WHERE GEO != 'Canada' AND VALUE IS NULL
 ORDER BY REF_DATE, GEO --- 414 VALUES

--- GRADUATE INTERNATIONAL TUITION DATA BY COUNTRY ONLY
SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[GraduateTuitionByFieldofStudy_InternationalStudents]
 WHERE GEO = 'Canada' AND VALUE IS NOT NULL
 ORDER BY REF_DATE, GEO --- 349 VALUES

SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[GraduateTuitionByFieldofStudy_InternationalStudents]
 WHERE GEO = 'Canada' AND VALUE IS NULL
 ORDER BY REF_DATE, GEO --- 19 NULL VALUES

--- GRADUATE INTERNATIONAL TUITION DATA BY PROVINCE
SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[GraduateTuitionByFieldofStudy_InternationalStudents]
 WHERE GEO != 'Canada' AND VALUE IS NOT NULL
 ORDER BY REF_DATE, GEO --- 2713 VALUES

SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[GraduateTuitionByFieldofStudy_InternationalStudents]
 WHERE GEO != 'Canada' AND VALUE IS NULL
 ORDER BY REF_DATE, GEO --- 609 VALUES

--- CREATE NEW TABLES WITH NO NULLS FOR EXPORT

---***---
CREATE TABLE UndergradDomesticTuition_Canada(
	Date nvarchar(50),
	Location nvarchar(50),
	Field_Of_Study nvarchar(100),
	Value int
)
INSERT INTO UndergradDomesticTuition_Canada(Date, Location, Field_Of_Study, Value)
SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[UndergradTuitionByFieldofStudy]
 WHERE GEO = 'Canada' AND VALUE IS NOT NULL
 ORDER BY REF_DATE, GEO --- 334 VALUES

SELECT * FROM UndergradDomesticTuition_Canada
DROP TABLE UndergradDomesticTuition_Canada
---***---

---***---
CREATE TABLE UndergradDomesticTuition_Province(
	Date nvarchar(50),
	Location nvarchar(50),
	Field_Of_Study nvarchar(100),
	Value int
)INSERT INTO UndergradDomesticTuition_Province(Date, Location, Field_Of_Study, Value)
SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[UndergradTuitionByFieldofStudy]
 WHERE GEO != 'Canada' AND VALUE IS NOT NULL
 ORDER BY REF_DATE, GEO --- 2930 VALUES

SELECT * FROM UndergradDomesticTuition_Province
DROP TABLE UndergradDomesticTuition_Province
---***---

---***---
CREATE TABLE GraduateDomesticTuition_Canada(
	Date nvarchar(50),
	Location nvarchar(50),
	Field_Of_Study nvarchar(100),
	Value int
)INSERT INTO GraduateDomesticTuition_Canada(Date, Location, Field_Of_Study, Value)
SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[GraduateTuitionByFieldofStudy]
 WHERE GEO = 'Canada' AND VALUE IS NOT NULL
 ORDER BY REF_DATE, GEO --- 352 VALUES

 SELECT * FROM GraduateDomesticTuition_Canada
 DROP TABLE GraduateDomesticTuition_Canada
 ---***---

 ---***---
 CREATE TABLE GraduateDomesticTuition_Province(
	Date nvarchar(50),
	Location nvarchar(50),
	Field_Of_Study nvarchar(100),
	Value int
)INSERT INTO GraduateDomesticTuition_Province(Date, Location, Field_Of_Study, Value)
SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[GraduateTuitionByFieldofStudy]
 WHERE GEO != 'Canada' AND VALUE IS NOT NULL
 ORDER BY REF_DATE, GEO --- 2830 VALUES

 SELECT * FROM GraduateDomesticTuition_Province
 DROP TABLE GraduateDomesticTuition_Province
 ---***---

 ---***---
 CREATE TABLE UndergradInternationalTuition_Canada(
	Date nvarchar(50),
	Location nvarchar(50),
	Field_Of_Study nvarchar(100),
	Value int
)INSERT INTO UndergradInternationalTuition_Canada(Date, Location, Field_Of_Study, Value)
SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[UndergradTuitionByFieldofStudy_InternationalStudents]
 WHERE GEO = 'Canada' AND VALUE IS NOT NULL
 ORDER BY REF_DATE, GEO --- 330 VALUES

SELECT * FROM UndergradInternationalTuition_Canada
DROP TABLE UndergradInternationalTuition_Canada
---***---
---***---
 CREATE TABLE UndergradInternationalTuition_Province(
	Date nvarchar(50),
	Location nvarchar(50),
	Field_Of_Study nvarchar(100),
	Value int
)INSERT INTO UndergradInternationalTuition_Province(Date, Location, Field_Of_Study, Value)
SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[UndergradTuitionByFieldofStudy_InternationalStudents]
 WHERE GEO != 'Canada' AND VALUE IS NOT NULL
 ORDER BY REF_DATE, GEO --- 2625 VALUES

SELECT * FROM UndergradInternationalTuition_Province
DROP TABLE UndergradInternationalTuition_Province
---***---

---***---
 CREATE TABLE GraduateInternationalTuition_Canada(
	Date nvarchar(50),
	Location nvarchar(50),
	Field_Of_Study nvarchar(100),
	Value int
)INSERT INTO GraduateInternationalTuition_Canada(Date, Location, Field_Of_Study, Value)
SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[GraduateTuitionByFieldofStudy_InternationalStudents]
 WHERE GEO = 'Canada' AND VALUE IS NOT NULL
 ORDER BY REF_DATE, GEO --- 349 VALUES

SELECT * FROM GraduateInternationalTuition_Canada
DROP TABLE GraduateInternationalTuition_Canada
---***---

---***---
 CREATE TABLE GraduateInternationalTuition_Province(
	Date nvarchar(50),
	Location nvarchar(50),
	Field_Of_Study nvarchar(100),
	Value int
)INSERT INTO GraduateInternationalTuition_Province(Date, Location, Field_Of_Study, Value)
SELECT REF_DATE, GEO, Field_of_study, VALUE
 FROM [Canada Tuition Data].[dbo].[GraduateTuitionByFieldofStudy_InternationalStudents]
 WHERE GEO != 'Canada' AND VALUE IS NOT NULL
 ORDER BY REF_DATE, GEO --- 2713 VALUES

SELECT * FROM GraduateInternationalTuition_Province
DROP TABLE GraduateInternationalTuition_Province
---***---
