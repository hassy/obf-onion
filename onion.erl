-module(onion).
-import(lists, [keysearch/3, map/2, splitwith/2]).
-compile(export_all).
-define(FIB,
        ": phi 5 sqrt 1 + 2 / ; : fib dup phi swap ^ swap 1 phi - swap ^ - 5 sqrt / ceil ; fib").

run(X) ->
    {ok, Modname, Codebin} = compile:file("w", [binary, debug_info, export_all]),
    code:load_binary(w, "nofile", Codebin),
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
