code=model_national3pct
vim ${code}.py -c ":hardcopy > ${code}.ps" -c ":q"
ps2pdf ${code}.ps web_plots/${code}.pdf
