; Autor reseni: Andrej Bliznak

; Projekt 2 - INP 2025
; Souhlaskove modulovana samohlaskova sifra na architekture MIPS64

; DATA SEGMENT
                .data
msg:            .asciiz "andrejbliznak" ; sem doplnte vase "jmenoprijmeni"
cipher:         .space  31 ; misto pro zapis zasifrovaneho textu
; zde si muzete nadefinovat vlastni promenne ci konstanty,

; napr. hodnoty posuvu pro jednotlive znaky sifrovacho klice

params_sys5:    .space  8 ; misto pro ulozeni adresy pocatku
                          ; retezce pro vypis pomoci syscall 5
                          ; (viz nize "funkce" print_string)

; CODE SEGMENT
                .text

main:           ; ZDE NAHRADTE KOD VASIM RESENIM
        daddi   r4, r0, msg ; vozrovy vypis: adresa msg do r4
        daddi   r5, r0, 0 ;      index i pre for
        daddi   r6, r0, 25 ;     pociatocny kluc
        daddi   r8, r0, cipher ; adresa cipher
    loop:
        lb r7, 0(r4) ;              loadujem msg do r7 
        beq r7, r0, end ;        ak sme na '\0' tak koncime

        ;check samohlasok
        daddi r9, r0, 97
        beq r7, r9, samohlaska
        daddi r9, r0, 101
        beq r7, r9, samohlaska
        daddi r9, r0, 105
        beq r7, r9, samohlaska
        daddi r9, r0, 111
        beq r7, r9, samohlaska
        daddi r9, r0, 117
        beq r7, r9, samohlaska
        daddi r9, r0, 121
        beq r7, r9, samohlaska

            ;ak sme tu tak je to spoluhlaska
        sb r7, 0(r8) ;  rovno hodim do vystupneho bez sifrovania
            ;a vyriesim kluc keby dalsia polozka v r7 bude samohlaska
        daddi r6, r7, -97 ; odcitame od kluca standard a
        daddi r6, r6, 1  ; pridame 1 nech zachova cislovanie od 1 po 26
        j pocitadla

    pocitadla:
        daddi r8, r8, 1 ; zvysime velkosti oboch "poli" a 
        daddi r4, r4, 1 ; vratime sa do cyklu
        j loop 
    
    samohlaska:
            ;namet v c: cip[i] = ((c - 'a') + key) % 26 + 'a'
        daddi r10, r7, -97 ; (c - 'a')
        add r10, r10, r6    ; r10+=r6
        daddi r11, r0, 26          ; r11 = 26 
        div r10, r11        ; r10 / r11 (zvysok v r10)
        mfhi r10            ; 
        addi r10, r10, 97    ; all + 'a'
        sb r10, 0(r8)          ; zapis do cipher
        j pocitadla
    end:
        sb r0, 0(r8)           ; ukoncovaci znak
        daddi r4, r0, cipher

        jal     print_string ; vypis pomoci print_string - viz nize


; NASLEDUJICI KOD NEMODIFIKUJTE!

                syscall 0   ; halt

print_string:   ; adresa retezce se ocekava v r4
                sw      r4, params_sys5(r0)
                daddi   r14, r0, params_sys5    ; adr pro syscall 5 musi do r14
                syscall 5   ; systemova procedura - vypis retezce na terminal
                jr      r31 ; return - r31 je urcen na return address
