-module(khf1).
-author('email@unit.org.hu').
-vsn('year-mm-dd').
%-export([feldarabolasa/2]).
-compile(export_all).

sorok(M, Eleje, _R, Acc) when (Eleje > length(M)) -> lists:reverse(Acc);
sorok(M, Eleje, R, Acc) -> sorok(M, Eleje + R, R, [lists:sublist(M, Eleje, R)|Acc]).

feldarabolasa(M, {R, C}) -> 1.