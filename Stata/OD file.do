



/* 
 * The file https://dataverse.fgv.br/dataset.xhtml?persistentId=hdl:10438.3/FK2/S5ECCO was reduced by this script.
 * 
 */

use "RJMA_ordinary_mobility_given_by_two_calls.dta"
/* Initially with 50 MB */

label variable day  "The day of year"
label variable origin  "The Geographic partition of the origin"
label variable destination "The Geographic partition of the destination"
label variable tc_no_expansion "Travel Counting, no expansion"
label variable tc_fixed_expansion "Travel Counting, fixed expansion"
label variable tc_adap_expansion "Travel Counting, adaptive expansion"

/* levelsof -- Distinct levels of a variable 
 * It produces a list of distinct values, that we will be using in the next step.
 */
levelsof origin, separate(,)

label define places 1 "ANCHIETA" 2 "BANGU" 3 "BARRA DA TIJUCA" 4 "BELFORD ROXO" 5 "BOTAFOGO" 6 "CACHOEIRAS DE MACACU" 7 "CAMPO GRANDE" 8 "CENTRO" 9 "CIDADE DE DEUS" 10 "COMPLEXO DO ALEMAO" 11 "COPACABANA" 12 "DUQUE DE CAXIAS" 13 "GUAPIMIRIM" 14 "GUARATIBA" 15 "ILHA DE PAQUETA" 16 "ILHA DO GOVERNADOR" 17 "INHAUMA" 18 "IRAJA" 19 "ITABORAI" 20 "ITAGUAI" 21 "JACAREPAGUA" 22 "JACAREZINHO" 23 "JAPERI" 24 "LAGOA" 25 "MADUREIRA" 26 "MAGE" 27 "MARE" 28 "MARICA" 29 "MEIER" 30 "MESQUITA" 31 "NILOPOLIS" 32 "NITEROI" 33 "NOVA IGUACU" 34 "PARACAMBI" 35 "PAVUNA" 36 "PENHA" 37 "PORTUARIA" 38 "QUEIMADOS" 39 "RAMOS" 40 "REALENGO" 41 "RIO BONITO" 42 "RIO COMPRIDO" 43 "ROCINHA" 44 "SANTA CRUZ" 45 "SANTA TERESA" 46 "SAO CRISTOVAO" 47 "SAO GONCALO" 48 "SAO JOAO DE MERITI" 49 "SEROPEDICA" 50 "TANGUA" 51 "TERESOPOLIS" 52 "TIJUCA" 53 "VIGARIO GERAL" 54 "VILA ISABEL"

generate byte destid:places=.
replace destid=1 if destination=="ANCHIETA"
replace destid=2 if destination=="BANGU"
replace destid=3 if destination=="BARRA DA TIJUCA"
replace destid=4 if destination=="BELFORD ROXO"
replace destid=5 if destination=="BOTAFOGO"
replace destid=6 if destination=="CACHOEIRAS DE MACACU"
replace destid=7 if destination=="CAMPO GRANDE"
replace destid=8 if destination=="CENTRO"
replace destid=9 if destination=="CIDADE DE DEUS"
replace destid=10 if destination=="COMPLEXO DO ALEMAO"
replace destid=11 if destination=="COPACABANA"
replace destid=12 if destination=="DUQUE DE CAXIAS"
replace destid=13 if destination=="GUAPIMIRIM"
replace destid=14 if destination=="GUARATIBA"
replace destid=15 if destination=="ILHA DE PAQUETA"
replace destid=16 if destination=="ILHA DO GOVERNADOR"
replace destid=17 if destination=="INHAUMA"
replace destid=18 if destination=="IRAJA"
replace destid=19 if destination=="ITABORAI"
replace destid=20 if destination=="ITAGUAI"
replace destid=21 if destination=="JACAREPAGUA"
replace destid=22 if destination=="JACAREZINHO"
replace destid=23 if destination=="JAPERI"
replace destid=24 if destination=="LAGOA"
replace destid=25 if destination=="MADUREIRA"
replace destid=26 if destination=="MAGE"
replace destid=27 if destination=="MARE"
replace destid=28 if destination=="MARICA"
replace destid=29 if destination=="MEIER"
replace destid=30 if destination=="MESQUITA"
replace destid=31 if destination=="NILOPOLIS"
replace destid=32 if destination=="NITEROI"
replace destid=33 if destination=="NOVA IGUACU"
replace destid=34 if destination=="PARACAMBI"
replace destid=35 if destination=="PAVUNA"
replace destid=36 if destination=="PENHA"
replace destid=37 if destination=="PORTUARIA"
replace destid=38 if destination=="QUEIMADOS"
replace destid=39 if destination=="RAMOS"
replace destid=40 if destination=="REALENGO"
replace destid=41 if destination=="RIO BONITO"
replace destid=42 if destination=="RIO COMPRIDO"
replace destid=43 if destination=="ROCINHA"
replace destid=44 if destination=="SANTA CRUZ"
replace destid=45 if destination=="SANTA TERESA"
replace destid=46 if destination=="SAO CRISTOVAO"
replace destid=47 if destination=="SAO GONCALO"
replace destid=48 if destination=="SAO JOAO DE MERITI"
replace destid=49 if destination=="SEROPEDICA"
replace destid=50 if destination=="TANGUA"
replace destid=51 if destination=="TERESOPOLIS"
replace destid=52 if destination=="TIJUCA"
replace destid=53 if destination=="VIGARIO GERAL"
replace destid=54 if destination=="VILA ISABEL"

label variable destid "The Geographic partition of the destination as a byte variable to save memory"

drop destination
save "RJMA_ordinary_mobility_given_by_two_calls.dta", replace

generate byte origid:places=.
replace origid=1 if origin=="ANCHIETA"
replace origid=2 if origin=="BANGU"
replace origid=3 if origin=="BARRA DA TIJUCA"
replace origid=4 if origin=="BELFORD ROXO"
replace origid=5 if origin=="BOTAFOGO"
replace origid=6 if origin=="CACHOEIRAS DE MACACU"
replace origid=7 if origin=="CAMPO GRANDE"
replace origid=8 if origin=="CENTRO"
replace origid=9 if origin=="CIDADE DE DEUS"
replace origid=10 if origin=="COMPLEXO DO ALEMAO"
replace origid=11 if origin=="COPACABANA"
replace origid=12 if origin=="DUQUE DE CAXIAS"
replace origid=13 if origin=="GUAPIMIRIM"
replace origid=14 if origin=="GUARATIBA"
replace origid=15 if origin=="ILHA DE PAQUETA"
replace origid=16 if origin=="ILHA DO GOVERNADOR"
replace origid=17 if origin=="INHAUMA"
replace origid=18 if origin=="IRAJA"
replace origid=19 if origin=="ITABORAI"
replace origid=20 if origin=="ITAGUAI"
replace origid=21 if origin=="JACAREPAGUA"
replace origid=22 if origin=="JACAREZINHO"
replace origid=23 if origin=="JAPERI"
replace origid=24 if origin=="LAGOA"
replace origid=25 if origin=="MADUREIRA"
replace origid=26 if origin=="MAGE"
replace origid=27 if origin=="MARE"
replace origid=28 if origin=="MARICA"
replace origid=29 if origin=="MEIER"
replace origid=30 if origin=="MESQUITA"
replace origid=31 if origin=="NILOPOLIS"
replace origid=32 if origin=="NITEROI"
replace origid=33 if origin=="NOVA IGUACU"
replace origid=34 if origin=="PARACAMBI"
replace origid=35 if origin=="PAVUNA"
replace origid=36 if origin=="PENHA"
replace origid=37 if origin=="PORTUARIA"
replace origid=38 if origin=="QUEIMADOS"
replace origid=39 if origin=="RAMOS"
replace origid=40 if origin=="REALENGO"
replace origid=41 if origin=="RIO BONITO"
replace origid=42 if origin=="RIO COMPRIDO"
replace origid=43 if origin=="ROCINHA"
replace origid=44 if origin=="SANTA CRUZ"
replace origid=45 if origin=="SANTA TERESA"
replace origid=46 if origin=="SAO CRISTOVAO"
replace origid=47 if origin=="SAO GONCALO"
replace origid=48 if origin=="SAO JOAO DE MERITI"
replace origid=49 if origin=="SEROPEDICA"
replace origid=50 if origin=="TANGUA"
replace origid=51 if origin=="TERESOPOLIS"
replace origid=52 if origin=="TIJUCA"
replace origid=53 if origin=="VIGARIO GERAL"
replace origid=54 if origin=="VILA ISABEL"

label variable origid "The Geographic partition of the origin as a byte variable to save memory"

drop origin 
save "RJMA_ordinary_mobility_given_by_two_calls.dta", replace

levelsof day, clean

label define daysid 1 "01/01/2014" 2 "01/01/2015" 3 "01/02/2014" 4 "01/03/2014" 5 "01/04/2014" 6 "01/05/2014" 7 "01/06/2014" 8 "01/07/2014" 9 "01/08/2014" 10 "01/09/2014" 11 "01/10/2014" 12 "01/12/2014" 13 "02/01/2014" 14 "02/02/2014" 15 "02/03/2014" 16 "02/04/2014" 17 "02/05/2014" 18 "02/06/2014" 19 "02/07/2014" 20 "02/08/2014" 21 "02/09/2014" 22 "02/10/2014" 23 "02/11/2014" 24 "02/12/2014" 25 "03/01/2014" 26 "03/02/2014" 27 "03/03/2014" 28 "03/04/2014" 29 "03/05/2014" 30 "03/06/2014" 31 "03/07/2014" 32 "03/08/2014" 33 "03/09/2014" 34 "03/11/2014" 35 "03/12/2014" 36 "04/01/2014" 37 "04/02/2014" 38 "04/03/2014" 39 "04/04/2014" 40 "04/05/2014" 41 "04/06/2014" 42 "04/07/2014" 43 "04/08/2014" 44 "04/09/2014" 45 "04/10/2014" 46 "04/11/2014" 47 "04/12/2014" 48 "05/01/2014" 49 "05/02/2014" 50 "05/03/2014" 51 "05/04/2014" 52 "05/05/2014" 53 "05/06/2014" 54 "05/07/2014" 55 "05/08/2014" 56 "05/09/2014" 57 "05/10/2014" 58 "05/11/2014" 59 "05/12/2014" 60 "06/01/2014" 61 "06/02/2014" 62 "06/03/2014" 63 "06/04/2014" 64 "06/05/2014" 65 "06/06/2014" 66 "06/07/2014" 67 "06/08/2014" 68 "06/09/2014" 69 "06/10/2014" 70 "06/11/2014" 71 "06/12/2014" 72 "07/01/2014" 73 "07/02/2014" 74 "07/03/2014" 75 "07/04/2014" 76 "07/05/2014" 77 "07/06/2014" 78 "07/07/2014" 79 "07/08/2014" 80 "07/09/2014" 81 "07/10/2014" 82 "07/11/2014" 83 "07/12/2014" 84 "08/01/2014" 85 "08/02/2014" 86 "08/03/2014" 87 "08/04/2014" 88 "08/05/2014" 89 "08/06/2014" 90 "08/07/2014" 91 "08/08/2014" 92 "08/09/2014" 93 "08/10/2014" 94 "08/11/2014" 95 "08/12/2014" 96 "09/01/2014" 97 "09/02/2014" 98 "09/03/2014" 99 "09/04/2014" 100 "09/05/2014" 101 "09/06/2014" 102 "09/07/2014" 103 "09/08/2014" 104 "09/09/2014" 105 "09/10/2014" 106 "09/11/2014" 107 "09/12/2014" 108 "10/01/2014" 109 "10/02/2014" 110 "10/03/2014" 111 "10/04/2014" 112 "10/05/2014" 113 "10/06/2014" 114 "10/07/2014" 115 "10/08/2014" 116 "10/09/2014" 117 "10/10/2014" 118 "10/11/2014" 119 "10/12/2014" 120 "11/01/2014" 121 "11/02/2014" 122 "11/03/2014" 123 "11/04/2014" 124 "11/05/2014" 125 "11/06/2014" 126 "11/07/2014" 127 "11/08/2014" 128 "11/09/2014" 129 "11/10/2014" 130 "11/11/2014" 131 "11/12/2014" 132 "12/01/2014" 133 "12/02/2014" 134 "12/03/2014" 135 "12/04/2014" 136 "12/05/2014" 137 "12/06/2014" 138 "12/07/2014" 139 "12/08/2014" 140 "12/09/2014" 141 "12/10/2014" 142 "12/11/2014" 143 "12/12/2014" 144 "13/01/2014" 145 "13/02/2014" 146 "13/03/2014" 147 "13/04/2014" 148 "13/05/2014" 149 "13/06/2014" 150 "13/07/2014" 151 "13/08/2014" 152 "13/09/2014" 153 "13/10/2014" 154 "13/11/2014" 155 "13/12/2014" 156 "14/01/2014" 157 "14/03/2014" 158 "14/04/2014" 159 "14/05/2014" 160 "14/06/2014" 161 "14/07/2014" 162 "14/08/2014" 163 "14/09/2014" 164 "14/10/2014" 165 "14/11/2014" 166 "14/12/2014" 167 "15/01/2014" 168 "15/02/2014" 169 "15/03/2014" 170 "15/04/2014" 171 "15/05/2014" 172 "15/06/2014" 173 "15/07/2014" 174 "15/08/2014" 175 "15/09/2014" 176 "15/10/2014" 177 "15/11/2014" 178 "15/12/2014" 179 "16/02/2014" 180 "16/03/2014" 181 "16/04/2014" 182 "16/05/2014" 183 "16/06/2014" 184 "16/07/2014" 185 "16/08/2014" 186 "16/09/2014" 187 "16/10/2014" 188 "16/11/2014" 189 "16/12/2014" 190 "17/01/2014" 191 "17/02/2014" 192 "17/03/2014" 193 "17/04/2014" 194 "17/05/2014" 195 "17/06/2014" 196 "17/07/2014" 197 "17/08/2014" 198 "17/09/2014" 199 "17/10/2014" 200 "17/11/2014" 201 "17/12/2014" 202 "18/01/2014" 203 "18/02/2014" 204 "18/03/2014" 205 "18/04/2014" 206 "18/05/2014" 207 "18/06/2014" 208 "18/07/2014" 209 "18/08/2014" 210 "18/09/2014" 211 "18/10/2014" 212 "18/11/2014" 213 "18/12/2014" 214 "19/01/2014" 215 "19/02/2014" 216 "19/03/2014" 217 "19/04/2014" 218 "19/05/2014" 219 "19/06/2014" 220 "19/07/2014" 221 "19/08/2014" 222 "19/09/2014" 223 "19/10/2014" 224 "19/11/2014" 225 "19/12/2014" 226 "20/01/2014" 227 "20/02/2014" 228 "20/03/2014" 229 "20/04/2014" 230 "20/05/2014" 231 "20/06/2014" 232 "20/07/2014" 233 "20/08/2014" 234 "20/09/2014" 235 "20/10/2014" 236 "20/11/2014" 237 "20/12/2014" 238 "21/01/2014" 239 "21/02/2014" 240 "21/03/2014" 241 "21/04/2014" 242 "21/05/2014" 243 "21/06/2014" 244 "21/07/2014" 245 "21/08/2014" 246 "21/09/2014" 247 "21/10/2014" 248 "21/11/2014" 249 "21/12/2014" 250 "22/01/2014" 251 "22/02/2014" 252 "22/03/2014" 253 "22/04/2014" 254 "22/05/2014" 255 "22/06/2014" 256 "22/07/2014" 257 "22/08/2014" 258 "22/09/2014" 259 "22/10/2014" 260 "22/11/2014" 261 "22/12/2014" 262 "23/01/2014" 263 "23/02/2014" 264 "23/03/2014" 265 "23/04/2014" 266 "23/05/2014" 267 "23/06/2014" 268 "23/07/2014" 269 "23/08/2014" 270 "23/09/2014" 271 "23/10/2014" 272 "23/11/2014" 273 "23/12/2014" 274 "24/01/2014" 275 "24/02/2014" 276 "24/03/2014" 277 "24/04/2014" 278 "24/05/2014" 279 "24/06/2014" 280 "24/07/2014" 281 "24/08/2014" 282 "24/09/2014" 283 "24/10/2014" 284 "24/11/2014" 285 "24/12/2014" 286 "25/01/2014" 287 "25/02/2014" 288 "25/03/2014" 289 "25/04/2014" 290 "25/05/2014" 291 "25/06/2014" 292 "25/07/2014" 293 "25/08/2014" 294 "25/09/2014" 295 "25/10/2014" 296 "25/11/2014" 297 "25/12/2014" 298 "26/01/2014" 299 "26/02/2014" 300 "26/03/2014" 301 "26/04/2014" 302 "26/05/2014" 303 "26/06/2014" 304 "26/07/2014" 305 "26/08/2014" 306 "26/09/2014" 307 "26/10/2014" 308 "26/11/2014" 309 "26/12/2014" 310 "27/01/2014" 311 "27/02/2014" 312 "27/03/2014" 313 "27/04/2014" 314 "27/05/2014" 315 "27/06/2014" 316 "27/07/2014" 317 "27/08/2014" 318 "27/09/2014" 319 "27/10/2014" 320 "27/11/2014" 321 "27/12/2014" 322 "28/01/2014" 323 "28/02/2014" 324 "28/03/2014" 325 "28/04/2014" 326 "28/05/2014" 327 "28/06/2014" 328 "28/07/2014" 329 "28/08/2014" 330 "28/09/2014" 331 "28/10/2014" 332 "28/11/2014" 333 "28/12/2014" 334 "29/01/2014" 335 "29/03/2014" 336 "29/04/2014" 337 "29/05/2014" 338 "29/06/2014" 339 "29/07/2014" 340 "29/08/2014" 341 "29/09/2014" 342 "29/10/2014" 343 "29/11/2014" 344 "29/12/2014" 345 "30/01/2014" 346 "30/03/2014" 347 "30/04/2014" 348 "30/05/2014" 349 "30/06/2014" 350 "30/07/2014" 351 "30/08/2014" 352 "30/09/2014" 353 "30/10/2014" 354 "30/11/2014" 355 "30/12/2014" 356 "31/01/2014" 357 "31/03/2014" 358 "31/05/2014" 359 "31/07/2014" 360 "31/08/2014" 361 "31/10/2014" 362 "31/12/2013" 363 "31/12/2014" 

generate int dayid:daysid=.
replace dayid=1 if day=="01/01/2014"
replace dayid=2 if day=="01/01/2015"
replace dayid=3 if day=="01/02/2014"
replace dayid=4 if day=="01/03/2014"
replace dayid=5 if day=="01/04/2014"
replace dayid=6 if day=="01/05/2014"
replace dayid=7 if day=="01/06/2014"
replace dayid=8 if day=="01/07/2014"
replace dayid=9 if day=="01/08/2014"
replace dayid=10 if day=="01/09/2014"
replace dayid=11 if day=="01/10/2014"
replace dayid=12 if day=="01/12/2014"
replace dayid=13 if day=="02/01/2014"
replace dayid=14 if day=="02/02/2014"
replace dayid=15 if day=="02/03/2014"
replace dayid=16 if day=="02/04/2014"
replace dayid=17 if day=="02/05/2014"
replace dayid=18 if day=="02/06/2014"
replace dayid=19 if day=="02/07/2014"
replace dayid=20 if day=="02/08/2014"
replace dayid=21 if day=="02/09/2014"
replace dayid=22 if day=="02/10/2014"
replace dayid=23 if day=="02/11/2014"
replace dayid=24 if day=="02/12/2014"
replace dayid=25 if day=="03/01/2014"
replace dayid=26 if day=="03/02/2014"
replace dayid=27 if day=="03/03/2014"
replace dayid=28 if day=="03/04/2014"
replace dayid=29 if day=="03/05/2014"
replace dayid=30 if day=="03/06/2014"
replace dayid=31 if day=="03/07/2014"
replace dayid=32 if day=="03/08/2014"
replace dayid=33 if day=="03/09/2014"
replace dayid=34 if day=="03/11/2014"
replace dayid=35 if day=="03/12/2014"
replace dayid=36 if day=="04/01/2014"
replace dayid=37 if day=="04/02/2014"
replace dayid=38 if day=="04/03/2014"
replace dayid=39 if day=="04/04/2014"
replace dayid=40 if day=="04/05/2014"
replace dayid=41 if day=="04/06/2014"
replace dayid=42 if day=="04/07/2014"
replace dayid=43 if day=="04/08/2014"
replace dayid=44 if day=="04/09/2014"
replace dayid=45 if day=="04/10/2014"
replace dayid=46 if day=="04/11/2014"
replace dayid=47 if day=="04/12/2014"
replace dayid=48 if day=="05/01/2014"
replace dayid=49 if day=="05/02/2014"
replace dayid=50 if day=="05/03/2014"
replace dayid=51 if day=="05/04/2014"
replace dayid=52 if day=="05/05/2014"
replace dayid=53 if day=="05/06/2014"
replace dayid=54 if day=="05/07/2014"
replace dayid=55 if day=="05/08/2014"
replace dayid=56 if day=="05/09/2014"
replace dayid=57 if day=="05/10/2014"
replace dayid=58 if day=="05/11/2014"
replace dayid=59 if day=="05/12/2014"
replace dayid=60 if day=="06/01/2014"
replace dayid=61 if day=="06/02/2014"
replace dayid=62 if day=="06/03/2014"
replace dayid=63 if day=="06/04/2014"
replace dayid=64 if day=="06/05/2014"
replace dayid=65 if day=="06/06/2014"
replace dayid=66 if day=="06/07/2014"
replace dayid=67 if day=="06/08/2014"
replace dayid=68 if day=="06/09/2014"
replace dayid=69 if day=="06/10/2014"
replace dayid=70 if day=="06/11/2014"
replace dayid=71 if day=="06/12/2014"
replace dayid=72 if day=="07/01/2014"
replace dayid=73 if day=="07/02/2014"
replace dayid=74 if day=="07/03/2014"
replace dayid=75 if day=="07/04/2014"
replace dayid=76 if day=="07/05/2014"
replace dayid=77 if day=="07/06/2014"
replace dayid=78 if day=="07/07/2014"
replace dayid=79 if day=="07/08/2014"
replace dayid=80 if day=="07/09/2014"
replace dayid=81 if day=="07/10/2014"
replace dayid=82 if day=="07/11/2014"
replace dayid=83 if day=="07/12/2014"
replace dayid=84 if day=="08/01/2014"
replace dayid=85 if day=="08/02/2014"
replace dayid=86 if day=="08/03/2014"
replace dayid=87 if day=="08/04/2014"
replace dayid=88 if day=="08/05/2014"
replace dayid=89 if day=="08/06/2014"
replace dayid=90 if day=="08/07/2014"
replace dayid=91 if day=="08/08/2014"
replace dayid=92 if day=="08/09/2014"
replace dayid=93 if day=="08/10/2014"
replace dayid=94 if day=="08/11/2014"
replace dayid=95 if day=="08/12/2014"
replace dayid=96 if day=="09/01/2014"
replace dayid=97 if day=="09/02/2014"
replace dayid=98 if day=="09/03/2014"
replace dayid=99 if day=="09/04/2014"
replace dayid=100 if day=="09/05/2014"
replace dayid=101 if day=="09/06/2014"
replace dayid=102 if day=="09/07/2014"
replace dayid=103 if day=="09/08/2014"
replace dayid=104 if day=="09/09/2014"
replace dayid=105 if day=="09/10/2014"
replace dayid=106 if day=="09/11/2014"
replace dayid=107 if day=="09/12/2014"
replace dayid=108 if day=="10/01/2014"
replace dayid=109 if day=="10/02/2014"
replace dayid=110 if day=="10/03/2014"
replace dayid=111 if day=="10/04/2014"
replace dayid=112 if day=="10/05/2014"
replace dayid=113 if day=="10/06/2014"
replace dayid=114 if day=="10/07/2014"
replace dayid=115 if day=="10/08/2014"
replace dayid=116 if day=="10/09/2014"
replace dayid=117 if day=="10/10/2014"
replace dayid=118 if day=="10/11/2014"
replace dayid=119 if day=="10/12/2014"
replace dayid=120 if day=="11/01/2014"
replace dayid=121 if day=="11/02/2014"
replace dayid=122 if day=="11/03/2014"
replace dayid=123 if day=="11/04/2014"
replace dayid=124 if day=="11/05/2014"
replace dayid=125 if day=="11/06/2014"
replace dayid=126 if day=="11/07/2014"
replace dayid=127 if day=="11/08/2014"
replace dayid=128 if day=="11/09/2014"
replace dayid=129 if day=="11/10/2014"
replace dayid=130 if day=="11/11/2014"
replace dayid=131 if day=="11/12/2014"
replace dayid=132 if day=="12/01/2014"
replace dayid=133 if day=="12/02/2014"
replace dayid=134 if day=="12/03/2014"
replace dayid=135 if day=="12/04/2014"
replace dayid=136 if day=="12/05/2014"
replace dayid=137 if day=="12/06/2014"
replace dayid=138 if day=="12/07/2014"
replace dayid=139 if day=="12/08/2014"
replace dayid=140 if day=="12/09/2014"
replace dayid=141 if day=="12/10/2014"
replace dayid=142 if day=="12/11/2014"
replace dayid=143 if day=="12/12/2014"
replace dayid=144 if day=="13/01/2014"
replace dayid=145 if day=="13/02/2014"
replace dayid=146 if day=="13/03/2014"
replace dayid=147 if day=="13/04/2014"
replace dayid=148 if day=="13/05/2014"
replace dayid=149 if day=="13/06/2014"
replace dayid=150 if day=="13/07/2014"
replace dayid=151 if day=="13/08/2014"
replace dayid=152 if day=="13/09/2014"
replace dayid=153 if day=="13/10/2014"
replace dayid=154 if day=="13/11/2014"
replace dayid=155 if day=="13/12/2014"
replace dayid=156 if day=="14/01/2014"
replace dayid=157 if day=="14/03/2014"
replace dayid=158 if day=="14/04/2014"
replace dayid=159 if day=="14/05/2014"
replace dayid=160 if day=="14/06/2014"
replace dayid=161 if day=="14/07/2014"
replace dayid=162 if day=="14/08/2014"
replace dayid=163 if day=="14/09/2014"
replace dayid=164 if day=="14/10/2014"
replace dayid=165 if day=="14/11/2014"
replace dayid=166 if day=="14/12/2014"
replace dayid=167 if day=="15/01/2014"
replace dayid=168 if day=="15/02/2014"
replace dayid=169 if day=="15/03/2014"
replace dayid=170 if day=="15/04/2014"
replace dayid=171 if day=="15/05/2014"
replace dayid=172 if day=="15/06/2014"
replace dayid=173 if day=="15/07/2014"
replace dayid=174 if day=="15/08/2014"
replace dayid=175 if day=="15/09/2014"
replace dayid=176 if day=="15/10/2014"
replace dayid=177 if day=="15/11/2014"
replace dayid=178 if day=="15/12/2014"
replace dayid=179 if day=="16/02/2014"
replace dayid=180 if day=="16/03/2014"
replace dayid=181 if day=="16/04/2014"
replace dayid=182 if day=="16/05/2014"
replace dayid=183 if day=="16/06/2014"
replace dayid=184 if day=="16/07/2014"
replace dayid=185 if day=="16/08/2014"
replace dayid=186 if day=="16/09/2014"
replace dayid=187 if day=="16/10/2014"
replace dayid=188 if day=="16/11/2014"
replace dayid=189 if day=="16/12/2014"
replace dayid=190 if day=="17/01/2014"
replace dayid=191 if day=="17/02/2014"
replace dayid=192 if day=="17/03/2014"
replace dayid=193 if day=="17/04/2014"
replace dayid=194 if day=="17/05/2014"
replace dayid=195 if day=="17/06/2014"
replace dayid=196 if day=="17/07/2014"
replace dayid=197 if day=="17/08/2014"
replace dayid=198 if day=="17/09/2014"
replace dayid=199 if day=="17/10/2014"
replace dayid=200 if day=="17/11/2014"
replace dayid=201 if day=="17/12/2014"
replace dayid=202 if day=="18/01/2014"
replace dayid=203 if day=="18/02/2014"
replace dayid=204 if day=="18/03/2014"
replace dayid=205 if day=="18/04/2014"
replace dayid=206 if day=="18/05/2014"
replace dayid=207 if day=="18/06/2014"
replace dayid=208 if day=="18/07/2014"
replace dayid=209 if day=="18/08/2014"
replace dayid=210 if day=="18/09/2014"
replace dayid=211 if day=="18/10/2014"
replace dayid=212 if day=="18/11/2014"
replace dayid=213 if day=="18/12/2014"
replace dayid=214 if day=="19/01/2014"
replace dayid=215 if day=="19/02/2014"
replace dayid=216 if day=="19/03/2014"
replace dayid=217 if day=="19/04/2014"
replace dayid=218 if day=="19/05/2014"
replace dayid=219 if day=="19/06/2014"
replace dayid=220 if day=="19/07/2014"
replace dayid=221 if day=="19/08/2014"
replace dayid=222 if day=="19/09/2014"
replace dayid=223 if day=="19/10/2014"
replace dayid=224 if day=="19/11/2014"
replace dayid=225 if day=="19/12/2014"
replace dayid=226 if day=="20/01/2014"
replace dayid=227 if day=="20/02/2014"
replace dayid=228 if day=="20/03/2014"
replace dayid=229 if day=="20/04/2014"
replace dayid=230 if day=="20/05/2014"
replace dayid=231 if day=="20/06/2014"
replace dayid=232 if day=="20/07/2014"
replace dayid=233 if day=="20/08/2014"
replace dayid=234 if day=="20/09/2014"
replace dayid=235 if day=="20/10/2014"
replace dayid=236 if day=="20/11/2014"
replace dayid=237 if day=="20/12/2014"
replace dayid=238 if day=="21/01/2014"
replace dayid=239 if day=="21/02/2014"
replace dayid=240 if day=="21/03/2014"
replace dayid=241 if day=="21/04/2014"
replace dayid=242 if day=="21/05/2014"
replace dayid=243 if day=="21/06/2014"
replace dayid=244 if day=="21/07/2014"
replace dayid=245 if day=="21/08/2014"
replace dayid=246 if day=="21/09/2014"
replace dayid=247 if day=="21/10/2014"
replace dayid=248 if day=="21/11/2014"
replace dayid=249 if day=="21/12/2014"
replace dayid=250 if day=="22/01/2014"
replace dayid=251 if day=="22/02/2014"
replace dayid=252 if day=="22/03/2014"
replace dayid=253 if day=="22/04/2014"
replace dayid=254 if day=="22/05/2014"
replace dayid=255 if day=="22/06/2014"
replace dayid=256 if day=="22/07/2014"
replace dayid=257 if day=="22/08/2014"
replace dayid=258 if day=="22/09/2014"
replace dayid=259 if day=="22/10/2014"
replace dayid=260 if day=="22/11/2014"
replace dayid=261 if day=="22/12/2014"
replace dayid=262 if day=="23/01/2014"
replace dayid=263 if day=="23/02/2014"
replace dayid=264 if day=="23/03/2014"
replace dayid=265 if day=="23/04/2014"
replace dayid=266 if day=="23/05/2014"
replace dayid=267 if day=="23/06/2014"
replace dayid=268 if day=="23/07/2014"
replace dayid=269 if day=="23/08/2014"
replace dayid=270 if day=="23/09/2014"
replace dayid=271 if day=="23/10/2014"
replace dayid=272 if day=="23/11/2014"
replace dayid=273 if day=="23/12/2014"
replace dayid=274 if day=="24/01/2014"
replace dayid=275 if day=="24/02/2014"
replace dayid=276 if day=="24/03/2014"
replace dayid=277 if day=="24/04/2014"
replace dayid=278 if day=="24/05/2014"
replace dayid=279 if day=="24/06/2014"
replace dayid=280 if day=="24/07/2014"
replace dayid=281 if day=="24/08/2014"
replace dayid=282 if day=="24/09/2014"
replace dayid=283 if day=="24/10/2014"
replace dayid=284 if day=="24/11/2014"
replace dayid=285 if day=="24/12/2014"
replace dayid=286 if day=="25/01/2014"
replace dayid=287 if day=="25/02/2014"
replace dayid=288 if day=="25/03/2014"
replace dayid=289 if day=="25/04/2014"
replace dayid=290 if day=="25/05/2014"
replace dayid=291 if day=="25/06/2014"
replace dayid=292 if day=="25/07/2014"
replace dayid=293 if day=="25/08/2014"
replace dayid=294 if day=="25/09/2014"
replace dayid=295 if day=="25/10/2014"
replace dayid=296 if day=="25/11/2014"
replace dayid=297 if day=="25/12/2014"
replace dayid=298 if day=="26/01/2014"
replace dayid=299 if day=="26/02/2014"
replace dayid=300 if day=="26/03/2014"
replace dayid=301 if day=="26/04/2014"
replace dayid=302 if day=="26/05/2014"
replace dayid=303 if day=="26/06/2014"
replace dayid=304 if day=="26/07/2014"
replace dayid=305 if day=="26/08/2014"
replace dayid=306 if day=="26/09/2014"
replace dayid=307 if day=="26/10/2014"
replace dayid=308 if day=="26/11/2014"
replace dayid=309 if day=="26/12/2014"
replace dayid=310 if day=="27/01/2014"
replace dayid=311 if day=="27/02/2014"
replace dayid=312 if day=="27/03/2014"
replace dayid=313 if day=="27/04/2014"
replace dayid=314 if day=="27/05/2014"
replace dayid=315 if day=="27/06/2014"
replace dayid=316 if day=="27/07/2014"
replace dayid=317 if day=="27/08/2014"
replace dayid=318 if day=="27/09/2014"
replace dayid=319 if day=="27/10/2014"
replace dayid=320 if day=="27/11/2014"
replace dayid=321 if day=="27/12/2014"
replace dayid=322 if day=="28/01/2014"
replace dayid=323 if day=="28/02/2014"
replace dayid=324 if day=="28/03/2014"
replace dayid=325 if day=="28/04/2014"
replace dayid=326 if day=="28/05/2014"
replace dayid=327 if day=="28/06/2014"
replace dayid=328 if day=="28/07/2014"
replace dayid=329 if day=="28/08/2014"
replace dayid=330 if day=="28/09/2014"
replace dayid=331 if day=="28/10/2014"
replace dayid=332 if day=="28/11/2014"
replace dayid=333 if day=="28/12/2014"
replace dayid=334 if day=="29/01/2014"
replace dayid=335 if day=="29/03/2014"
replace dayid=336 if day=="29/04/2014"
replace dayid=337 if day=="29/05/2014"
replace dayid=338 if day=="29/06/2014"
replace dayid=339 if day=="29/07/2014"
replace dayid=340 if day=="29/08/2014"
replace dayid=341 if day=="29/09/2014"
replace dayid=342 if day=="29/10/2014"
replace dayid=343 if day=="29/11/2014"
replace dayid=344 if day=="29/12/2014"
replace dayid=345 if day=="30/01/2014"
replace dayid=346 if day=="30/03/2014"
replace dayid=347 if day=="30/04/2014"
replace dayid=348 if day=="30/05/2014"
replace dayid=349 if day=="30/06/2014"
replace dayid=350 if day=="30/07/2014"
replace dayid=351 if day=="30/08/2014"
replace dayid=352 if day=="30/09/2014"
replace dayid=353 if day=="30/10/2014"
replace dayid=354 if day=="30/11/2014"
replace dayid=355 if day=="30/12/2014"
replace dayid=356 if day=="31/01/2014"
replace dayid=357 if day=="31/03/2014"
replace dayid=358 if day=="31/05/2014"
replace dayid=359 if day=="31/07/2014"
replace dayid=360 if day=="31/08/2014"
replace dayid=361 if day=="31/10/2014"
replace dayid=362 if day=="31/12/2013"
replace dayid=363 if day=="31/12/2014"

label variable dayid "The day of the year as a int variable to save memory"
drop day
order dayid origid destid tc_no_expansion tc_fixed_expansion tc_adap_expansion, first

save "RJMA_ordinary_mobility_given_by_two_calls.dta", replace
