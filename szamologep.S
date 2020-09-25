.intel_syntax noprefix
.section .data
SCHIFTBAL: .ascii "<<"
SCHIFTJOBB: .ascii ">>"

HIBAS: .asciz "Nincs ilyen muvelet\n"

.section .text
.global calculator
calculator:
	push ebp
	mov ebp, esp

	push ebx
	

	mov ebx, 0
	
	/*cmp byte ptr [ebp + 16], '+'
	je osszeadas
	jmp valami_mas
	*/
	
	mov ecx, 0
	mov eax, [ebp + 16]
	cmp dword ptr [eax], '+'
	je osszeadas
	jmp valami_mas


	osszeadas:
		mov eax, [ebp + 8]
		mov ecx, [ebp + 12]
		add ebx, eax
		add ebx, ecx
		mov eax, ebx
		pop ebx
		jmp vegefele

	valami_mas:
		cmp dword ptr [eax], 42
		je szorzas
		jmp valami_masabb
		

	szorzas:
		mov eax, [ebp + 8]
		mov ecx, [ebp + 12]
		imul ecx
		
		pop ebx
		jmp vegefele

	valami_masabb:
		cmp dword ptr [eax], 45
		je kivonas
		jmp meg_masabb
		

	kivonas:
		mov eax, [ebp + 8]
		mov ecx, [ebp + 12]
		sbb eax, ecx
		pop ebx
		jmp vegefele

	meg_masabb:
		
		mov dx, SCHIFTBAL
		cmp word ptr [eax], dx
		je balschift
		jmp mar_csak_jobbschift

	balschift:
		mov eax, [ebp + 8]
		mov cl, [ebp + 12]
		shl eax, cl
		pop ebx
		jmp vegefele

	mar_csak_jobbschift:
		mov dx, SCHIFTJOBB
		cmp word ptr [eax],dx
		je jobbschift
		jmp hiba

	jobbschift:
		mov eax, [ebp + 8]
		mov cl, [ebp + 12]
		shr eax, cl
		pop ebx
		jmp vegefele

	hiba:
		push eax
		push offset HIBAS
		call printf
		add esp, 4
		pop ebx
		

	vegefele:

	mov esp, ebp
	pop ebp
	ret
