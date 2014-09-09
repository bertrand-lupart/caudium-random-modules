#include <module.h>

inherit "module";
inherit "caudiumlib";
inherit "cachelib";

constant cvs_version = "$Id$";
constant module_type = MODULE_PRECACHE|MODULE_FIRST;
constant module_name = "Caudium Random Module : Custom HTTP header";
constant module_doc =
  "<p>This module was created to debug custom HTTP headers</p>";

constant module_unique = 1;
constant thread_safe = 1;



/******************************************************************************
				  Caudium API
******************************************************************************/


// Method called when Caudium calls for MODULE_PRECACHE
void precache_rewrite()
{
  // Running X-Custom-Header-precache-<method_used>

  // ... using _extra_heads
  if(!id->misc->defines||!(mappingp(id->misc->defines)))
    id->misc->defines = ([ ]);
  if(!id->misc->defines[" _extra_heads"] || !mappingp(id->misc->defines[" _extra_heads"]))
    id->misc->defines[" _extra_heads"] = ([ ]);
  id->misc->defines[" _extra_heads"] += ([ "X-Custom-Header-precache-extra_heads" : "OK" ]);

  // ... using moreheads
  id->misc->moreheads = ([ "X-Custom-Header-precache-moreheads" : "OK" ]);

  return;
}


// Method called when Caudium calls for MODULE_FIRST
mixed first_try(object id)
{
  // Running X-Custom-Header-first_try-<method_used>

  // ... using _extra_heads
  if(!id->misc->defines||!(mappingp(id->misc->defines)))
    id->misc->defines = ([ ]);
  if(!id->misc->defines[" _extra_heads"] || !mappingp(id->misc->defines[" _extra_heads"]))
    id->misc->defines[" _extra_heads"] = ([ ]);
  id->misc->defines[" _extra_heads"] += ([ "X-Custom-Header-first_try-extra_heads" : "OK" ]);

  // ... using moreheads
  id->misc->moreheads = ([ "X-Custom-Header-first_try-moreheads" : "OK" ]);

  return 0;
}
