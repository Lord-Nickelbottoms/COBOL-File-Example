      *****************************************************************
      * Program name:    FILE-EXAMPLE                               
      * Original author: NIZAAM                                
      *
      * Maintenence Log                                              
      * Date      Author        Maintenance Requirement               
      * --------- ------------  --------------------------------------- 
      * 20/02/2025 NIZAAM  Created for COBOL class         
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  FILE-EXAMPLE.
       AUTHOR. NIZAAM. 
       INSTALLATION. COBOL DEVELOPMENT CENTER. 
       DATE-WRITTEN. 20/02/2025. 
       DATE-COMPILED. 20/02/2025. 
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************

       ENVIRONMENT DIVISION. 

       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT PERSON ASSIGN TO 'PEOPLE.TXT'.

       DATA DIVISION.

       FILE SECTION. 

       FD PERSON
           DATA RECORD IS PERSON-RECORD.

       01 PERSON-RECORD.
      *    05 PERSON-ID PIC 9(3).
      *    05 FILLER PIC X(10).
           05 PERSON_NAME PIC X(20).
           05 FILLER PIC X(10).
           05 AGE PIC 9(2).
           05 FILLER PIC X(10).
           
       WORKING-STORAGE SECTION. 
       01 WS-EOF PIC X(1) VALUE 'N'.
       01 WS-USER-NAME PIC A(30).
       01 WS-USER-AGE PIC 9(3).
       77 NAME PIC A(10).
       77 AGE PIC 9(3).       

       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           OPEN OUTPUT PERSON .

           INITIALIZE PERSON-RECORD

           PERFORM USER-INPUT.

           CLOSE PERSON.

           STOP RUN.

       USER-INPUT.
           DISPLAY 'Enter a name and surname: '.
           ACCEPT WS-USER-NAME.

           DISPLAY 'Enter their age: '.
           ACCEPT WS-USER-AGE.

           DISPLAY 'WRITING RECORD'
           PERFORM WRITE-PROCEDURE.
       
       WRITE-PROCEDURE.
           MOVE WS-USER-NAME TO PERSON_NAME IN PERSON-RECORD .
           MOVE WS-USER-AGE  TO AGE IN PERSON-RECORD .
           DISPLAY 'RECORD INSERTED'.
           
           WRITE PERSON-RECORD .
