BITS 16
switch:
    cli                         ; fuera interrupciones
    lgdt [gdt_descriptor]
    mov eax, cr0
    or eax, 0x1                 ; 32 bits
    mov cr0, eax
    jmp CODE_SEG:init_pm

BITS 32
init_pm:
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000
    mov esp, ebp

    call BEGIN_PM 