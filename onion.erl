-module(onion).
-import(lists, [keysearch/3, map/2, splitwith/2, reverse/1]).
-compile(export_all).
-define(FIB,
        "?? phi 5 ? 1 ??? 2 ????? ; ?? fib !!! phi !!!! ! !!!! 1 phi ???? !!!! ! ???? 5 ? ????? !! ; fib").

run(X) ->
    %%{ok, Modname, Codebin} = compile:file("w", [binary, debug_info, export_all]),
    %%code:load_binary(w, "nofile", Codebin),

    Forms = [{attribute,1,file,{"./w.erl",1}}, {attribute,1,module,w}, {attribute,2,compile,export_all}, {attribute,5,import,{lists,[{keysearch,3},{map,2},{splitwith,2}]}}, {function,7,parse,1, [{clause,7, [{var,7,'S'}], [], [{call,8, {atom,8,map}, [{'fun',8, {clauses, [{clause,8, [{var,8,'X'}], [], [{call,8, {atom,8,list_to_atom}, [{var,8,'X'}]}]}]}}, {call,8, {remote,8,{atom,8,string},{atom,8,tokens}}, [{var,8,'S'},{string,8," "}]}]}]}]}, {function,10,eval,1, [{clause,10, [{var,10,'Words'}], [], [{call,11,{atom,11,eval},[{var,11,'Words'},{nil,11}]}]}]}, {function,12,eval,2, [{clause,12, [{nil,12},{var,12,'Stack'}], [], [{call,12,{atom,12,hd},[{var,12,'Stack'}]}]}, {clause,13, [{cons,13,{var,13,'W'},{var,13,'R'}},{var,13,'Stack'}], [], [{match,14, {tuple,14,[{var,14,'Ns'},{var,14,'Nw'}]}, {call,14, {remote,14,{atom,14,w},{var,14,'W'}}, [{var,14,'Stack'},{var,14,'R'}]}}, {call,15,{atom,15,eval},[{var,15,'Nw'},{var,15,'Ns'}]}]}]}, {function,17,'??',2, [{clause,17, [{var,17,'Stack'},{var,17,'Tape'}], [], [{match,18, {tuple,18, [{cons,18,{var,18,'Name'},{var,18,'Exp'}}, {cons,18,{atom,18,';'},{var,18,'Rest'}}]}, {call,18, {atom,18,splitwith}, [{'fun',18, {clauses, [{clause,18, [{var,18,'X'}], [], [{op,18,'=/=', {var,18,'X'}, {atom,18,';'}}]}]}}, {var,18,'Tape'}]}}, {call,19, {atom,19,put}, [{atom,19,dict}, {cons,19, {tuple,19,[{var,19,'Name'},{var,19,'Exp'}]}, {call,19,{atom,19,get},[{atom,19,dict}]}}]}, {tuple,20,[{var,20,'Stack'},{var,20,'Rest'}]}]}]}, {function,22,'???',2, [{clause,22, [{cons,22,{var,22,'F'},{cons,22,{var,22,'S'},{var,22,'R'}}}, {var,22,'Tape'}], [], [{tuple,23, [{cons,23,{op,23,'+',{var,23,'F'},{var,23,'S'}},{var,23,'R'}}, {var,23,'Tape'}]}]}]}, {function,24,'????',2, [{clause,24, [{cons,24,{var,24,'F'},{cons,24,{var,24,'S'},{var,24,'R'}}}, {var,24,'Tape'}], [], [{tuple,25, [{cons,25,{op,25,'-',{var,25,'S'},{var,25,'F'}},{var,25,'R'}}, {var,25,'Tape'}]}]}]}, {function,26,'?????',2, [{clause,26, [{cons,26,{var,26,'F'},{cons,26,{var,26,'S'},{var,26,'R'}}}, {var,26,'Tape'}], [], [{tuple,27, [{cons,27,{op,27,'/',{var,27,'S'},{var,27,'F'}},{var,27,'R'}}, {var,27,'Tape'}]}]}]}, {function,28,'!',2, [{clause,28, [{cons,28,{var,28,'F'},{cons,28,{var,28,'S'},{var,28,'R'}}}, {var,28,'Tape'}], [], [{tuple,29, [{cons,29, {call,29, {remote,29,{atom,29,math},{atom,29,pow}}, [{var,29,'S'},{var,29,'F'}]}, {var,29,'R'}}, {var,29,'Tape'}]}]}]}, {function,30,'!!',2, [{clause,30, [{cons,30,{var,30,'F'},{var,30,'R'}},{var,30,'Tape'}], [], [{tuple,31, [{cons,31, {'case',31, {op,31,'<', {op,31,'-', {var,31,'F'}, {call,31,{atom,31,trunc},[{var,31,'F'}]}}, {integer,31,0}}, [{clause,32, [{atom,32,true}], [], [{op,32,'-', {call,32,{atom,32,trunc},[{var,32,'F'}]}, {integer,32,1}}]}, {clause,33, [{atom,33,false}], [], [{call,33,{atom,33,trunc},[{var,33,'F'}]}]}]}, {var,34,'R'}}, {var,34,'Tape'}]}]}]}, {function,35,'?',2, [{clause,35, [{cons,35,{var,35,'F'},{var,35,'R'}},{var,35,'Tape'}], [], [{tuple,36, [{cons,36, {call,36, {remote,36,{atom,36,math},{atom,36,sqrt}}, [{var,36,'F'}]}, {var,36,'R'}}, {var,36,'Tape'}]}]}]}, {function,37,'!!!',2, [{clause,37, [{cons,37,{var,37,'F'},{var,37,'R'}},{var,37,'Tape'}], [], [{tuple,38, [{cons,38,{var,38,'F'},{cons,38,{var,38,'F'},{var,38,'R'}}}, {var,38,'Tape'}]}]}]}, {function,39,'!!!!',2, [{clause,39, [{cons,39,{var,39,'F'},{cons,39,{var,39,'S'},{var,39,'R'}}}, {var,39,'Tape'}], [], [{tuple,40, [{cons,40,{var,40,'S'},{cons,40,{var,40,'F'},{var,40,'R'}}}, {var,40,'Tape'}]}]}]}, {function,41,'.',2, [{clause,41, [{var,41,'Stack'},{var,41,'Tape'}], [], [{call,42, {remote,42,{atom,42,io},{atom,42,format}}, [{string,42,"Stack = ~p~nTape = ~p~n"}, {cons,42, {var,42,'Stack'}, {cons,42,{var,42,'Tape'},{nil,42}}}]}, {tuple,43,[{var,43,'Stack'},{var,43,'Tape'}]}]}]}, {eof,44}],
    {ok, Modname, Codebin} = compile:forms(Forms, [binary, debug_info, export_all, {parse_transform, ?MODULE}]),
    code:load_binary(w, "nofile", Codebin),

    process_flag(error_handler, Modname),
    put(dict, []),
    if is_number(X) -> Modname:eval(Modname:parse(integer_to_list(X) ++ " " ++ ?FIB));
       true         -> Modname:eval(Modname:parse(X))
    end.

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

parse_transform(Forms, _Opts) ->
    %% save eof, append undefined_function, append eof
    %% need forms for undefined_function - use erl_scan & erl_parse on a string
    UndefinedFunction = "undefined_function(_, F, [Stack, Tape]) -> case keysearch(F, 1, get(dict)) of {value, {_, Exp}} -> {Stack, Exp ++ Tape}; false -> Strtonum = fun(S) -> case catch(list_to_integer(S)) of {'EXIT', _} -> list_to_float(S); I -> I end end,{[Strtonum(atom_to_list(F))|Stack], Tape} end.",
    {ok, Toks, _} = erl_scan:string(UndefinedFunction),
    {ok, FuncForms} = erl_parse:parse_form(Toks),
    [Eof|ReversedCode] = reverse(Forms),
    reverse(ReversedCode) ++ [FuncForms] ++ [Eof].

rot13(X) when is_list(X) -> lists:map(fun rot13/1, X);
rot13(X) when X >= $a, X <  $n; X >= $A, X <  $N -> X + 13;
rot13(X) when X >= $n, X <  ${; X >= $N, X < $[ -> X - 13;
rot13(X) -> X.
