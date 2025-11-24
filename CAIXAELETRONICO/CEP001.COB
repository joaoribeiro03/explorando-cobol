      *-----------------------------------------------------------------
      **                         CAIXA ELETRÔNICO
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. CEP001.
       AUTHOR. "JOÃO LUCAS".

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           77 WS-OPCAO    PIC X(2).
           77 WS-SALDO    PIC 9(10)V99 VALUE ZERO.
           77 WS-DEPOSITO PIC 9(10)V99 VALUE ZERO.
           77 WS-SAQUE    PIC 9(10)V99 VALUE ZERO.

       PROCEDURE DIVISION.
       MAIN-PROGRAM.
           PERFORM P001-MENU
           STOP RUN.

      *-------------------- MENU PRINCIPAL ---------------------------------
       P001-MENU.
           DISPLAY "---------------------------------".
           DISPLAY "        CAIXA ELETRONICO         ".
           DISPLAY "---------------------------------".
           DISPLAY "1 - CONSULTAR SALDO".
           DISPLAY "2 - DEPOSITAR".
           DISPLAY "3 - SACAR".
           DISPLAY "9 - SAIR".
           DISPLAY "---------------------------------".
           DISPLAY "OPCAO: ".
           ACCEPT WS-OPCAO.

           EVALUATE WS-OPCAO
               WHEN "1"
                    PERFORM P010-SALDO
               WHEN "2"
                    PERFORM P020-DEPOSITO
               WHEN "3"
                    PERFORM P030-SAQUE
               WHEN "9"
                    PERFORM P099-SAIR
               WHEN OTHER
                    DISPLAY "OPCAO INVALIDA! TENTE NOVAMENTE."
           END-EVALUATE.

           PERFORM P001-MENU.
      *------------------------------------------------------------------------

      *-------------------- CONSULTAR SALDO -----------------------------------
       P010-SALDO.
           DISPLAY "---------------------------------".
           DISPLAY "        CONSULTA DE SALDO        ".
           DISPLAY "---------------------------------".
           DISPLAY "SEU SALDO ATUAL E: R$ " WS-SALDO.
           DISPLAY " ".
      *------------------------------------------------------------------------

      *-------------------- DEPOSITAR -----------------------------------------
       P020-DEPOSITO.
           DISPLAY "---------------------------------".
           DISPLAY "             DEPOSITO            ".
           DISPLAY "---------------------------------".
           DISPLAY "DIGITE O VALOR DO DEPOSITO: ".
           ACCEPT WS-DEPOSITO.

           COMPUTE WS-SALDO = WS-SALDO + WS-DEPOSITO.

           DISPLAY "DEPOSITO REALIZADO COM SUCESSO!".
           DISPLAY "SEU SALDO ATUAL E: R$ " WS-SALDO.
           DISPLAY " ".
      *------------------------------------------------------------------------

      *-------------------- SACAR ---------------------------------------------
       P030-SAQUE.
           DISPLAY "---------------------------------".
           DISPLAY "               SAQUE             ".
           DISPLAY "---------------------------------".
           DISPLAY "DIGITE O VALOR DO SAQUE: ".
           ACCEPT WS-SAQUE.

           IF WS-SAQUE > WS-SALDO
               DISPLAY "SALDO INSUFICIENTE!"
           ELSE
               COMPUTE WS-SALDO = WS-SALDO - WS-SAQUE
               DISPLAY "SAQUE REALIZADO COM SUCESSO!"
               DISPLAY "SEU SALDO ATUAL É: R$ " WS-SALDO
           END-IF.

           DISPLAY " ".
      *------------------------------------------------------------------------

      *-------------------- SAIR ----------------------------------------------
       P099-SAIR.
           DISPLAY "---------------------------------".
           DISPLAY "     SISTEMA ENCERRADO.          ".
           DISPLAY "---------------------------------".
           STOP RUN.
      *------------------------------------------------------------------------
        END PROGRAM CEP001.