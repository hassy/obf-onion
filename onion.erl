-module(onion).
-import(lists, [keysearch/3, map/2, splitwith/2, reverse/1]).
-compile(export_all).
-define(_, "?? phi 5 ? 1 ??? 2 ????? ; ?? fib !!! phi !!!! ! !!!! 1 phi ???? !!!! ! ???? 5 ? ????? !! ; fib").
run(X) ->
    S = "[{nggevohgr,1,svyr,{\"./j.rey\",1}}, {nggevohgr,1,zbqhyr,j}, {nggevohgr,2,pbzcvyr,rkcbeg_nyy}, {nggevohgr,5,vzcbeg,{yvfgf,[{xrlfrnepu,3},{znc,2},{fcyvgjvgu,2}]}}, {shapgvba,7,cnefr,1, [{pynhfr,7, [{ine,7,'F'}], [], [{pnyy,8, {ngbz,8,znc}, [{'sha',8, {pynhfrf, [{pynhfr,8, [{ine,8,'K'}], [], [{pnyy,8, {ngbz,8,yvfg_gb_ngbz}, [{ine,8,'K'}]}]}]}}, {pnyy,8, {erzbgr,8,{ngbz,8,fgevat},{ngbz,8,gbxraf}}, [{ine,8,'F'},{fgevat,8,\" \"}]}]}]}]}, {shapgvba,10,riny,1, [{pynhfr,10, [{ine,10,'Jbeqf'}], [], [{pnyy,11,{ngbz,11,riny},[{ine,11,'Jbeqf'},{avy,11}]}]}]}, {shapgvba,12,riny,2, [{pynhfr,12, [{avy,12},{ine,12,'Fgnpx'}], [], [{pnyy,12,{ngbz,12,uq},[{ine,12,'Fgnpx'}]}]}, {pynhfr,13, [{pbaf,13,{ine,13,'J'},{ine,13,'E'}},{ine,13,'Fgnpx'}], [], [{zngpu,14, {ghcyr,14,[{ine,14,'Af'},{ine,14,'Aj'}]}, {pnyy,14, {erzbgr,14,{ngbz,14,j},{ine,14,'J'}}, [{ine,14,'Fgnpx'},{ine,14,'E'}]}}, {pnyy,15,{ngbz,15,riny},[{ine,15,'Aj'},{ine,15,'Af'}]}]}]}, {shapgvba,17,'??',2, [{pynhfr,17, [{ine,17,'Fgnpx'},{ine,17,'Gncr'}], [], [{zngpu,18, {ghcyr,18, [{pbaf,18,{ine,18,'Anzr'},{ine,18,'Rkc'}}, {pbaf,18,{ngbz,18,';'},{ine,18,'Erfg'}}]}, {pnyy,18, {ngbz,18,fcyvgjvgu}, [{'sha',18, {pynhfrf, [{pynhfr,18, [{ine,18,'K'}], [], [{bc,18,'=/=', {ine,18,'K'}, {ngbz,18,';'}}]}]}}, {ine,18,'Gncr'}]}}, {pnyy,19, {ngbz,19,chg}, [{ngbz,19,qvpg}, {pbaf,19, {ghcyr,19,[{ine,19,'Anzr'},{ine,19,'Rkc'}]}, {pnyy,19,{ngbz,19,trg},[{ngbz,19,qvpg}]}}]}, {ghcyr,20,[{ine,20,'Fgnpx'},{ine,20,'Erfg'}]}]}]}, {shapgvba,22,'???',2, [{pynhfr,22, [{pbaf,22,{ine,22,'S'},{pbaf,22,{ine,22,'F'},{ine,22,'E'}}}, {ine,22,'Gncr'}], [], [{ghcyr,23, [{pbaf,23,{bc,23,'+',{ine,23,'S'},{ine,23,'F'}},{ine,23,'E'}}, {ine,23,'Gncr'}]}]}]}, {shapgvba,24,'????',2, [{pynhfr,24, [{pbaf,24,{ine,24,'S'},{pbaf,24,{ine,24,'F'},{ine,24,'E'}}}, {ine,24,'Gncr'}], [], [{ghcyr,25, [{pbaf,25,{bc,25,'-',{ine,25,'F'},{ine,25,'S'}},{ine,25,'E'}}, {ine,25,'Gncr'}]}]}]}, {shapgvba,26,'?????',2, [{pynhfr,26, [{pbaf,26,{ine,26,'S'},{pbaf,26,{ine,26,'F'},{ine,26,'E'}}}, {ine,26,'Gncr'}], [], [{ghcyr,27, [{pbaf,27,{bc,27,'/',{ine,27,'F'},{ine,27,'S'}},{ine,27,'E'}}, {ine,27,'Gncr'}]}]}]}, {shapgvba,28,'!',2, [{pynhfr,28, [{pbaf,28,{ine,28,'S'},{pbaf,28,{ine,28,'F'},{ine,28,'E'}}}, {ine,28,'Gncr'}], [], [{ghcyr,29, [{pbaf,29, {pnyy,29, {erzbgr,29,{ngbz,29,zngu},{ngbz,29,cbj}}, [{ine,29,'F'},{ine,29,'S'}]}, {ine,29,'E'}}, {ine,29,'Gncr'}]}]}]}, {shapgvba,30,'!!',2, [{pynhfr,30, [{pbaf,30,{ine,30,'S'},{ine,30,'E'}},{ine,30,'Gncr'}], [], [{ghcyr,31, [{pbaf,31, {'pnfr',31, {bc,31,'<', {bc,31,'-', {ine,31,'S'}, {pnyy,31,{ngbz,31,gehap},[{ine,31,'S'}]}}, {vagrtre,31,0}}, [{pynhfr,32, [{ngbz,32,gehr}], [], [{bc,32,'-', {pnyy,32,{ngbz,32,gehap},[{ine,32,'S'}]}, {vagrtre,32,1}}]}, {pynhfr,33, [{ngbz,33,snyfr}], [], [{pnyy,33,{ngbz,33,gehap},[{ine,33,'S'}]}]}]}, {ine,34,'E'}}, {ine,34,'Gncr'}]}]}]}, {shapgvba,35,'?',2, [{pynhfr,35, [{pbaf,35,{ine,35,'S'},{ine,35,'E'}},{ine,35,'Gncr'}], [], [{ghcyr,36, [{pbaf,36, {pnyy,36, {erzbgr,36,{ngbz,36,zngu},{ngbz,36,fdeg}}, [{ine,36,'S'}]}, {ine,36,'E'}}, {ine,36,'Gncr'}]}]}]}, {shapgvba,37,'!!!',2, [{pynhfr,37, [{pbaf,37,{ine,37,'S'},{ine,37,'E'}},{ine,37,'Gncr'}], [], [{ghcyr,38, [{pbaf,38,{ine,38,'S'},{pbaf,38,{ine,38,'S'},{ine,38,'E'}}}, {ine,38,'Gncr'}]}]}]}, {shapgvba,39,'!!!!',2, [{pynhfr,39, [{pbaf,39,{ine,39,'S'},{pbaf,39,{ine,39,'F'},{ine,39,'E'}}}, {ine,39,'Gncr'}], [], [{ghcyr,40, [{pbaf,40,{ine,40,'F'},{pbaf,40,{ine,40,'S'},{ine,40,'E'}}}, {ine,40,'Gncr'}]}]}]}, {shapgvba,41,'.',2, [{pynhfr,41, [{ine,41,'Fgnpx'},{ine,41,'Gncr'}], [], [{pnyy,42, {erzbgr,42,{ngbz,42,vb},{ngbz,42,sbezng}}, [{fgevat,42,\"Fgnpx = ~c~aGncr = ~c~a\"}, {pbaf,42, {ine,42,'Fgnpx'}, {pbaf,42,{ine,42,'Gncr'},{avy,42}}}]}, {ghcyr,43,[{ine,43,'Fgnpx'},{ine,43,'Gncr'}]}]}]}, {rbs,44}].",
    {ok, T, _} = erl_scan:string('?!?'(S)),
    {ok, F} = erl_parse:parse_term(T),
    {ok, W, B} = compile:forms(F, [binary, debug_info, export_all, {parse_transform, ?MODULE}]),
    code:load_binary(w, "enoent", B),
    process_flag(error_handler, W),
    put(dict, []),
    if is_number(X) -> W:eval(W:parse(integer_to_list(X) ++ " " ++ ?_));
       true         -> W:eval(W:parse(X))
    end.

parse_transform(Forms, _Opts) ->
    Uf = "haqrsvarq_shapgvba(_, S, [Fgnpx, Gncr]) -> pnfr xrlfrnepu(S, 1, trg(qvpg)) bs {inyhr, {_, Rkc}} -> {Fgnpx, Rkc ++ Gncr}; snyfr -> Fgegbahz = sha(F) -> pnfr pngpu(yvfg_gb_vagrtre(F)) bs {'RKVG', _} -> yvfg_gb_sybng(F); V -> V raq raq,{[Fgegbahz(ngbz_gb_yvfg(S))|Fgnpx], Gncr} raq.",
    {ok, T, _} = erl_scan:string('?!?'(Uf)),
    {ok, Ff} = erl_parse:parse_form(T),
    [Eof|Rc] = reverse(Forms),
    reverse(Rc)++[Ff]++[Eof].

'?!?'(X) when is_list(X) -> lists:map(fun '?!?'/1, X);
'?!?'(X) when X >= $a, X <  $n; X >= $A, X <  $N -> X + 13;
'?!?'(X) when X >= $n, X <  ${; X >= $N, X < $[ -> X - 13;
'?!?'(X) -> X.
