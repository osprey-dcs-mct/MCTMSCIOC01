-- $File: //ASP/opa/mct/iocs/MCTMSCIOC01/MCTMSCIOC01App/Db/vbm_stripe_calc.lua $
-- $Revision: #2 $
-- $DateTime: 2021/09/01 18:01:36 $
-- Last checked in by: $Author: pozara $
--
-- Description:
-- Calculation which stript the beam is on. The beam has to be entirely on one
-- stripe for the calculation to report a stripe. That means that the beam can
-- motor position can diviate from what is considered to be the center of the 
-- beam by +-0.5mm.
--

function currentStripe()
   Rh = -19
   Pt = 19
   tolerance = 0.5
   if A < 0 and B < 0 and math.abs(A - Rh) < tolerance and math.abs(B - Rh) < tolerance then
      return "Rh"
   elseif A > 0 and B > 0 and math.abs(A - Pt) < tolerance and math.abs(B - Pt) < tolerance then
      return "Pt"
   else
      return "None"
   end
end