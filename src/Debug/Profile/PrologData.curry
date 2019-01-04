------------------------------------------------------------------------------
--- Library to access profile data of the Prolog system.
--- Implementation might be deprecated for new SICStus-Prolog systems.
---
--- IMPORT NOTE: If this module is used, one must set the PAKCS option
--- "plprofile" (with ":set +plprofile") in order to make the profile
--- data available from the Prolog system!
---
--- @author Michael Hanus
--- @version January 2019
------------------------------------------------------------------------------

module Debug.Profile.PrologData where

-- Kind of selected profile data:
data ProfileSelection = Calls | Backtracks | ChoicePoints | ExecTime

--- Resets all profile counters.
profileReset :: IO ()
profileReset external

--- Gets profile data of all predicates.
profilePredicates :: ProfileSelection -> IO [(String,Int)]
profilePredicates ps = prim_profilePredicates $# ps

prim_profilePredicates :: ProfileSelection -> IO [(String,Int)]
prim_profilePredicates external

--- Gets profile data of all clauses of a particular predicate.
--- The result is a list of pairs (predicate number, profile count)
profileClauses :: ProfileSelection -> String -> IO [(Int,Int)]
profileClauses ps pred = (prim_profileClauses $# ps) $## pred

prim_profileClauses :: ProfileSelection -> String -> IO [(Int,Int)]
prim_profileClauses external


--- Print the Prolog profile data.
printProfileData :: IO ()
printProfileData external


--- Starts graphical viewer for profile data via the Gauge profiling
--- tool of Sicstus Prolog.
profileView :: IO ()
profileView external

-- Gets the association of HNF clauses to functions symbols
--- (only for internal use).
getHnfDefinitions :: IO [(Int,String)]
getHnfDefinitions external

