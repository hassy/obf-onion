-module(onion).
-import(lists, [keysearch/3, map/2, splitwith/2]).
-compile(export_all).
-define(FIB,
        ": phi 5 sqrt 1 + 2 / ; : fib dup phi swap ^ swap 1 phi - swap ^ - 5 sqrt / ceil ; fib").

run(X) ->
    process_flag(error_handler, ?MODULE),
    put(dict, []),
    if is_number(X) -> eval(parse(integer_to_list(X) ++ " " ++ ?FIB));
       true         -> eval(parse(X))
    end.

parse(S) ->
    map(fun(X) -> list_to_atom(X) end, string:tokens(S, " ")).

eval(Words)        -> eval(Words, []).
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

%% Handles pushing numbers and word expansion.
undefined_function(_, F, [Stack, Tape]) ->
    case keysearch(F, 1, get(dict)) of
        {value, {_, Exp}} -> %  expand word
            {Stack, Exp ++ Tape};
        false -> % push a number
            {[strtonum(atom_to_list(F))|Stack], Tape}
    end.

strtonum(S) ->
    case catch(list_to_integer(S)) of
        {'EXIT', _} -> list_to_float(S);
        I -> I
    end.
