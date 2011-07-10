-module(w).
-compile(export_all).
%%-compile({parse_transform, print_forms}).
-import(lists, [keysearch/3, map/2, splitwith/2]).

foo() ->
    "Hello from w.".

parse(S) ->
    map(fun(X) -> list_to_atom(X) end, string:tokens(S, " ")).

eval(Words)        -> 
    eval(Words, []).
eval([], Stack)     -> hd(Stack);
eval([W|R], Stack) ->
    {Ns, Nw} = ?MODULE:W(Stack, R),
    eval(Nw, Ns).
    
':'(Stack, Tape) ->
    {[Name|Exp], [';'|Rest]} = splitwith(fun(X) -> X =/= ';' end, Tape),
    put(dict, [{Name, Exp}|get(dict)]),
    {Stack, Rest}.

'+'([F, S | R], Tape) ->
    {[F+S | R], Tape}.
'-'([F, S | R], Tape) ->
    {[S-F | R], Tape}.
'/'([F, S | R], Tape) ->
    {[S/F | R], Tape}.
'^'([F, S | R], Tape) ->
    {[math:pow(S,F) | R], Tape}.
ceil([F|R], Tape) ->
    {[case F - trunc(F) < 0 of
          true  -> trunc(F) - 1;
          false -> trunc(F)
      end|R], Tape}.
sqrt([F|R], Tape) ->
    {[math:sqrt(F)|R], Tape}.
dup([F|R], Tape) ->
    {[F,F|R], Tape}.
swap([F,S|R], Tape) ->
    {[S,F|R], Tape}.
'.'(Stack, Tape) ->
    io:format("Stack = ~p~nTape = ~p~n", [Stack, Tape]),
    {Stack, Tape}.
