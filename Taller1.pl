% Enfermedades
enfermedad(gripe).
enfermedad(rubeola).
enfermedad(malaria).
enfermedad(hepatitis).
enfermedad(tuberculosis).
enfermedad(anemia).

% Sintomas segun enfermedad
sintomade(diarrea, gripe).
sintomade(tos, gripe).
sintomade(fiebre, gripe).
sintomade(dolordecabeza, gripe).

sintomade(fiebre, rubeola).
sintomade(dolordecuerpo, rubeola).
sintomade(nauseas, rubeola).

sintomade(fiebre, malaria).
sintomade(escalofrios, malaria).
sintomade(dolordecabeza, malaria).

sintomade(ictericia, hepatitis).
sintomade(dolorabdominal, hepatitis).
sintomade(cansancio, hepatitis).

sintomade(cansancio, tuberculosis).
sintomade(tos, tuberculosis).
sintomade(dolordetorax, tuberculosis).

sintomade(cansancio, anemia).
sintomade(apetitolimitado, anemia).
sintomade(palidez, anemia).

% Medicinas segun enfermedad
medicinade(jarabe, gripe).
medicinade(contrex, gripe).
medicinade(vitamina, rubeola).
medicinade(vacuna, malaria).
medicinade(pastilla, tuberculosis).
medicinade(suplementos, anemia).

% Especialistas segun enfermedad
especialistade(otorrino, gripe).
especialistade(medicogeneral, rubeola).
especialistade(medicogeneral, malaria).
especialistade(endocrinologo, hepatitis).
especialistade(neumologo, tuberculosis).
especialistade(nutricionista, anemia).

% 1. Determinar los medicos para una enfermedad
atiende_medico(Medico, Enfermedad) :- especialistade(Medico, Enfermedad).

% 2. Medicinas para un síntoma
medicina_para_sintoma(Medicina, Sintoma) :- sintomade(Sintoma, Enfermedad), medicinade(Medicina, Enfermedad).

% 3. Relación de medicos y medicinas con una enfermedad
tratamiento_para(Enfermedad, Medico, Medicina) :-
    especialistade(Medico, Enfermedad),
    medicinade(Medicina, Enfermedad).

% 4. Probabilidad de enfermedad segun sintomas dados
contar_sintomas([], _, 0).
contar_sintomas([Sintoma|Resto], Enfermedad, Cantidad) :-
    sintomade(Sintoma, Enfermedad),
    contar_sintomas(Resto, Enfermedad, CantidadParcial),
    Cantidad is CantidadParcial + 1.
contar_sintomas([_|Resto], Enfermedad, Cantidad) :-
    contar_sintomas(Resto, Enfermedad, Cantidad).

total_sintomas(Enfermedad, Total) :-
    findall(Sintoma, sintomade(Sintoma, Enfermedad), Sintomas),
    length(Sintomas, Total).

probabilidad_enfermedad(Sintomas, Enfermedad, Probabilidad) :-
    contar_sintomas(Sintomas, Enfermedad, Cantidad),
    total_sintomas(Enfermedad, Total),
    Probabilidad is (Cantidad / Total) * 100.

% 5. Mejor diagnostico basado en síntomas
mejor_diagnostico(Sintomas, MejorEnfermedad) :-
    findall((Prob, Enfermedad), (enfermedad(Enfermedad), probabilidad_enfermedad(Sintomas, Enfermedad, Prob)), Diagnosticos),
    sort(Diagnosticos, DiagnosticosOrdenados),
    reverse(DiagnosticosOrdenados, [(_, MejorEnfermedad)|_]).

% CONSULTAS:

% CONSULTAS:

% 1. Que medico atiende la gripe?
% ?- atiende_medico(Medico, gripe).

% 2. Que medico atiende la malaria?
% ?- atiende_medico(Medico, malaria).

% 3. Que medico atiende la tuberculosis?
% ?- atiende_medico(Medico, tuberculosis).

% 4. Que medicina se recomienda para la anemia?
% ?- medicinade(Medicina, anemia).

% 5. Que medicina se usa para tratar la hepatitis?
% ?- medicinade(Medicina, hepatitis).

% 6. Que sintomas estan asociados con la rubeola?
% ?- sintomade(Sintoma, rubeola).

% 7. Que sintomas estan asociados con la tuberculosis?
% ?- sintomade(Sintoma, tuberculosis).

% 8. Que medicina es efectiva para tratar la fiebre?
% ?- medicina_para_sintoma(Medicina, fiebre).

% 9. Que medicina es efectiva para tratar el cansancio?
% ?- medicina_para_sintoma(Medicina, cansancio).

% 10. Que medico y medicina se recomiendan para tratar la malaria?
% ?- tratamiento_para(malaria, Medico, Medicina).

% 11. Que medico y medicina se recomiendan para tratar la anemia?
% ?- tratamiento_para(anemia, Medico, Medicina).

% 12. Que probabilidad hay de tener hepatitis si se presentan ictericia y cansancio?
% ?- probabilidad_enfermedad([ictericia, cansancio], hepatitis, Probabilidad).

% 13. Que probabilidad hay de tener malaria si se presentan fiebre y escalofrios?
% ?- probabilidad_enfermedad([fiebre, escalofrios], malaria, Probabilidad).

% 14. Cual es la enfermedad mas probable si se presentan los sintomas fiebre y cansancio?
% ?- mejor_diagnostico([fiebre, cansancio], MejorEnfermedad).

% 15. Que medico atiende una enfermedad especifica ingresada por el usuario?
% ?- atiende_medico(Medico, Enfermedad).

% 16. Que medicina es efectiva para un sintoma especifico ingresado por el usuario?
% ?- medicina_para_sintoma(Medicina, Sintoma).

% 17. Que tratamiento completo (medico y medicina) se recomienda para una enfermedad ingresada?
% ?- tratamiento_para(Enfermedad, Medico, Medicina).

% 18. Cuales son los sintomas asociados con una enfermedad especifica?
% ?- sintomade(Sintoma, Enfermedad).

% 19. Cuales son todas las enfermedades tratadas por un medico especifico?
% ?- especialistade(medicogeneral, Enfermedad).

% 20. Que medicinas estan relacionadas con enfermedades que incluyen el sintoma 'tos'?
% ?- sintomade(tos, Enfermedad), medicinade(Medicina, Enfermedad).
