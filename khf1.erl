-module(khf1).
-author('lorinczb96@gmail.com').
-vsn('2019-10-07').
-export([feldarabolasa/2]).
%-compile(export_all).

% M matrix sorait R lepeskozonkent csoportositja
sorok(M, Eleje, _R, Acc) when (Eleje > length(M)) -> lists:reverse(Acc);
sorok(M, Eleje, R, Acc) -> sorok(M, Eleje + R, R, [lists:sublist(M, Eleje, R)|Acc]).

% L Lista elso elemenek a hossza
elsohossz(L) -> length(hd(L)).

% L lista oszlopokra bontasa segedfv.-nyel
oszlopok(L, C) -> oszlopBonto(L, 1, C, elsohossz(L),[]).

% L listabol olyan listat keszit amiben az L lista elemeit C lepeskozonkent csoportositja
oszlopBonto(_L, Eleje, _C, Elsohossz, Acc) when (Eleje > Elsohossz) -> lists:reverse(Acc);
oszlopBonto(L, Eleje, C, Elsohossz, Acc) -> oszlopBonto(L, Eleje + C, C, Elsohossz, [oszlop(L, Eleje, C, []) | Acc]).

% C lepeskoznyi lista elemek osszefuzese
oszlop(L, _Elso, _Utolso, Acc) when (length(L) < 1) -> Acc;
oszlop(L, Elso, C, Acc) -> oszlop(tl(L), Elso, C, lists:append(Acc, lists:sublist(hd(L), Elso, C))).

% Sorokra bontott matrix oszlopokra bontasa, majd sorfolytonos listaba fuzes
kisMatrixok(M, _C, Acc) when (length(M) < 1) -> Acc;
kisMatrixok(M, C, Acc) -> 	kisMatrixok(tl(M), C, lists:append(Acc, oszlopok(hd(M), C))).

feldarabolasa(M, {R, C}) -> kisMatrixok(sorok(M, 1, R, []), C, []).