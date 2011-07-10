-module(w).
-compile(export_all).
%% to get the forms for final file, uncomment below and recompile:
-compile({parse_transform, print_forms}).
-import(lists, [keysearch/3, map/2, splitwith/2]).

    %%{ok, Modname, Codebin} = compile:file("w", [binary, debug_info, export_all]),
    %%code:load_binary(w, "nofile", Codebin),


parse(S) ->
    map(fun(X) -> list_to_atom(X) end, string:tokens(S, " ")).

eval(Words)        -> 
    eval(Words, []).
eval([], Stack)     -> hd(Stack);
eval([W|R], Stack) ->
    {Ns, Nw} = ?MODULE:W(Stack, R),
    eval(Nw, Ns).
    
'??'(Stack, Tape) ->
    {[Name|Exp], [';'|Rest]} = splitwith(fun(X) -> X =/= ';' end, Tape),
    put(dict, [{Name, Exp}|get(dict)]),
    {Stack, Rest}. % :

'???'([F, S | R], Tape) ->
    {[F+S | R], Tape}. % +
'????'([F, S | R], Tape) ->
    {[S-F | R], Tape}. % -
'?????'([F, S | R], Tape) ->
    {[S/F | R], Tape}. % /
'!'([F, S | R], Tape) ->
    {[math:pow(S,F) | R], Tape}. % ^
'!!'([F|R], Tape) ->
    {[case F - trunc(F) < 0 of
          true  -> trunc(F) - 1;
          false -> trunc(F)
      end|R], Tape}. % ceil
'?'([F|R], Tape) ->
    {[math:sqrt(F)|R], Tape}. % sqrt
'!!!'([F|R], Tape) ->
    {[F,F|R], Tape}. % dup
'!!!!'([F,S|R], Tape) ->
    {[S,F|R], Tape}. % swap
'.'(Stack, Tape) ->
    io:format("Stack = ~p~nTape = ~p~n", [Stack, Tape]),
    {Stack, Tape}. % .

%% Handles pushing numbers and word expansion.
%% undefined_function(_, F, [Stack, Tape]) ->
%%     case keysearch(F, 1, get(dict)) of
%%         {value, {_, Exp}} ->
%%             {Stack, Exp ++ Tape};
%%         false ->
%%             Strtonum = fun(S) ->
%%                                case catch(list_to_integer(S)) of
%%                                    {'EXIT', _} -> list_to_float(S);
%%                                    I -> I
%%                                end
%%                        end,
                               
%%             {[Strtonum(atom_to_list(F))|Stack], Tape}
%%     end.
