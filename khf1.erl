-module(khf1).
-author('email@unit.org.hu').
-vsn('year-mm-dd').
%-export([feldarabolasa/2]).
-compile(export_all).

sorok(M, Eleje, _R, Acc) when (Eleje > length(M)) -> lists:reverse(Acc);
sorok(M, Eleje, R, Acc) -> sorok(M, Eleje + R, R, [lists:sublist(M, Eleje, R)|Acc]).

elsohossz(L) -> length(hd(L)).

oszlopok(L, C) -> oszlopBonto(L, 1, C, elsohossz(L),[]).

oszlopBonto(_L, Eleje, _C, Elsohossz, Acc) when (Eleje > Elsohossz) -> lists:reverse(Acc);
oszlopBonto(L, Eleje, C, Elsohossz, Acc) -> oszlopBonto(L, Eleje + C, C, Elsohossz, [oszlop(L, Eleje, Eleje + C, []) | Acc]).

oszlop(L, _Elso, _Utolso, Acc) when (length(L) < 1) -> Acc;
oszlop(L, Elso, Utolso, Acc) -> oszlop(tl(L), Elso, Utolso, lists:append(Acc, lists:sublist(hd(L), Elso, Utolso-Elso))).

kisMatrixok(M, _C, Acc) when (length(M) < 1) -> Acc;
kisMatrixok(M, C, Acc) -> 	kisMatrixok(tl(M), C, lists:append(Acc, oszlopok(hd(M), C))).

feldarabolasa(M, {R, C}) -> kisMatrixok(sorok(M, 1, R, []), C, []).