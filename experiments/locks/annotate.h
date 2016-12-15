#ifndef ANNOTATE_H
#define ANNOTATE_H

#define TESLA_FIELD(nm, st) nm __attribute__((annotate("field:"#st"."#nm)));

#endif
