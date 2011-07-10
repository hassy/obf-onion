-module(onion).
-import(lists, [keysearch/3, map/2, splitwith/2]).
-compile(export_all).
-define(FIB,
        ": phi 5 ? 1 + 2 / ; : fib dup phi swap ^ swap 1 phi - swap ^ - 5 ? / ceil ; fib").

run(X) ->
    {ok, Modname, Codebin} = compile:file("w", [binary, debug_info, export_all]),
    code:load_binary(w, "nofile", Codebin),

    %% Forms = PASTE HERE
    %% {ok, Modname, Codebin} = compile:forms(Forms, [binary, debug_info, export_all]),
    %% code:load_binary(w, "nofile", Codebin),

    process_flag(error_handler, ?MODULE),
    put(dict, []),
    if is_number(X) -> Modname:eval(Modname:parse(integer_to_list(X) ++ " " ++ ?FIB));
       true         -> Modname:eval(Modname:parse(X))
    end.

%% Handles pushing numbers and word expansion.
undefined_function(_, F, [Stack, Tape]) ->
    case keysearch(F, 1, get(dict)) of
        {value, {_, Exp}} -> %  expand word
            {Stack, Exp ++ Tape};
        false -> % push a number
            Strtonum = fun(S) ->
                               case catch(list_to_integer(S)) of
                                   {'EXIT', _} -> list_to_float(S);
                                   I -> I
                               end
                       end,
                               
            {[Strtonum(atom_to_list(F))|Stack], Tape}
    end.

parse_transform(Forms, _Opts) ->
    %% keysearch for eof
    %% then insert forms for the function before eof and done

    %% need forms for undefined_function - use erl_scan & erl_parse on a string
    Forms.

rot13(X) when is_list(X) -> lists:map(fun rot13/1, X);
rot13(X) when X >= $a, X <  $n; X >= $A, X <  $N -> X + 13;
rot13(X) when X >= $n, X <  ${; X >= $N, X < $[ -> X - 13;
rot13(X) -> X.
