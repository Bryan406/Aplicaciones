% Enfermedades
enfermedad(gripe).
enfermedad(rubeola).
enfermedad(malaria).
enfermedad(hepatitis).
enfermedad(tuberculosis).
enfermedad(anemia).

% Síntomas según enfermedad
sintomade(tos, gripe).
sintomade(cansancio, gripe).
sintomade(fiebre, gripe).
sintomade(dolorcabeza, gripe).
sintomade(fiebre, rubeola).
sintomade(erupciones, rubeola).
sintomade(dolorarticulaciones, rubeola).
sintomade(fiebre, malaria).
sintomade(escalofrios, malaria).
sintomade(sudoracion, malaria).
sintomade(dolorcabeza, malaria).
sintomade(ictericia, hepatitis).
sintomade(dolorabdominal, hepatitis).
sintomade(perdidaapetito, hepatitis).
sintomade(cansancio, tuberculosis).
sintomade(tos, tuberculosis).
sintomade(perdidadepeso, tuberculosis).
sintomade(palidextez, anemia).
sintomade(fatiga, anemia).
sintomade(dificultadrespirar, anemia).

% Medicinas dependiendo de la enfermedad
medicinade(contrex, gripe).
medicinade(jarabe, gripe).
medicinade(paracetamol, rubeola).
medicinade(vacuna, malaria).
medicinade(pastillas, tuberculosis).
medicinade(suplementos, anemia).

% Especialistas según la enfermedad
especialistade(otorrino, gripe).
especialistade(medicinageneral, rubeola).
especialistade(medicinageneral, malaria).
especialistade(endocrinologo, hepatitis).
especialistade(neumologo, tuberculosis).
especialistade(nutricionista, anemia).

% Reglas
% 1. Determinar si un especialista atiende una enfermedad
atiende_especialista(E, S):- sintomade(S, Z), especialistade(E, Z).

% 2. Determinar qué medicina se receta según el síntoma
recetade(M, S):- sintomade(S, Z), medicinade(M, Z).

% 3. Determinar el especialista y medicina para una enfermedad
mereceta(Es, M, E):- medicinade(M, E), especialistade(Es, E).

% 4. Determinar probabilidad de enfermedad según síntomas
buscar([], _, 0).
buscar([X|Xs], E, P):- sintomade(X, E), buscar(Xs, E, P1), P is P1 + 1.

cantSint(E, C):- findall(X, sintomade(X, E), L), length(L, C).

diagnostico(Sintomas, E, Prob):- buscar(Sintomas, E, P), cantSint(E, Total), Prob is (P * 100) / Total.

% 5. Sugerir enfermedad mas probable según los síntomas
mejor_diagnostico(Sintomas, MejorE):- 
    findall((Prob, E), (enfermedad(E), diagnostico(Sintomas, E, Prob)), Resultados),
    sort(Resultados, Sorted),
    reverse(Sorted, [(MaxProb, MejorE)|_]).

% Posibles consultas
% 1. ¿Qué especialista atiende la gripe?
%    ?- especialistade(X, gripe).
% 2. ¿Qué medicina trata la tuberculosis?
%    ?- medicinade(X, tuberculosis).
% 3. ¿Qué síntomas tiene la malaria?
%    ?- sintomade(X, malaria).
% 4. ¿Qué enfermedades causan fiebre?
%    ?- sintomade(fiebre, X).
% 5. ¿Cuál es la probabilidad de tener hepatitis si tengo ictericia y dolor abdominal?
%    ?- diagnostico([ictericia, dolorabdominal], hepatitis, Prob).
% 6. ¿Qué especialista y medicina se necesitan para la anemia?
%    ?- mereceta(Es, M, anemia).
% 7. ¿Qué síntomas comparte la gripe con la tuberculosis?
%    ?- sintomade(X, gripe), sintomade(X, tuberculosis).
% 8. ¿Qué enfermedad tiene el síntoma escalofríos?
%    ?- sintomade(escalofrios, X).
% 9. ¿Qué enfermedad trata el endocrinólogo?
%    ?- especialistade(endocrinologo, X).
% 10. ¿Qué medicinas se pueden recetar para la gripe?
%    ?- recetade(M, tos).
% 11. ¿Qué porcentaje de probabilidad tengo de tener malaria con fiebre y sudoración?
%    ?- diagnostico([fiebre, sudoracion], malaria, Prob).
% 12. ¿Qué síntomas tiene la anemia?
%    ?- sintomade(X, anemia).
% 13. ¿Qué especialista puede atender una persona con pérdida de peso?
%    ?- atiende_especialista(E, perdidadepeso).
% 14. ¿Qué enfermedad tiene pérdida de apetito como síntoma?
%    ?- sintomade(perdidaapetito, X).
% 15. ¿Qué medicinas se relacionan con el síntoma cansancio?
%    ?- recetade(M, cansancio).
% 16. ¿Cuál es la enfermedad mas probable si tengo fiebre y erupciones?
%    ?- mejor_diagnostico([fiebre, erupciones], MejorE).
% 17. ¿Cuántos síntomas tiene la gripe?
%    ?- cantSint(gripe, C).
% 18. ¿Qué enfermedades trata el medico general?
%    ?- especialistade(medicinageneral, X).
% 19. ¿Qué medicamento trata la malaria?
%    ?- medicinade(X, malaria).
% 20. ¿Qué especialista receta suplementos?
%    ?- medicinade(suplementos, E), especialistade(X, E).
