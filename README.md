# textfiend

TCL implementation of the hexfiend binary template API.

Work in progress, not all APIs implemented. See textfiend for TODOs and missing things.

# Examples

```sh
textfiend -j json MOV.tcl file.mp4 | jq '.. | .stts? | select(.) | .[0]'
textfiend -b -f json ID3v2.tcl file.mp3  | jq -rj '.[].APIC | .[0].Data' | iconv -f utf-8 -t ISO8859-1 > apic.jpg
textfiend -f json MOV.tcl testfag.mp4 | jq '.[].sidx[0]."Index table"[0][][] | {Size, Duration}'
```
