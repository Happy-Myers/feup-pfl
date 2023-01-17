:- op(500, xfx, na).
:- op(500, yfx, la).
:- op(500, xfy, ra).

%%%a

% a ra b na c

% a xfy b xfx c
% a xfy (b xfx c)
%OK

a ra b na c.

%%%b

% a la b na c

% a yfx b xfx c
% [la wants:] (a yfx b) xfx c // [na wants:] a yfx (b xfx c)
%CONFLICT

%%%c

% a na b la c

%a xfx b yfx c
% (a xfx b) yfx c
% OK

%%%d

% a na b ra c

% a xfx b xfy c

% [na wants:] (a xfx b) xfy c // [ra wants:] a xfx (b xfy c)
%CONFLICT

%%%e

% a na b na c

% a xfx b xfx c

% [na1 wants:] (a xfx b) xfx c // [na2 wants:] a xfx (b xfx c)
%CONFLICT

%%% f

% a la b la c

% a yfx b yfx c

% (a yfx b) yfx c
% OK

%%% g 

% a ra b ra c

%a xfy b xfy c

% a xfy (b xfy c)
%OK