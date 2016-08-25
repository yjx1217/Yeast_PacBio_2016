---
layout: page
title: Data
permalink: /data/
---

The genomes were sequenced by ~100-200x PacBio sequencing reads and assembled using standard HGAP pipeline with Quiver polishing. We also performed ~200-500x Illumina paired-end sequencing to further correct remaining sequencing errors by Pilon. After manual curation, the final assemblies reached chromsome-equivalent completeness for both nuclear and mitochondrial genomes. Based on each assembly, we conducted full-fledged annotation for various genomic features, such as centromeres, protein-coding genes, tRNAs, Ty retrotransposable elements, core X-elements, Y'-elements and mitochondrial RNAs.

Here, we provide all the assembly, annotation, CDSs, and proteome files as follows. The assembly, CDSs, and proteome files are in FASTA format. The annotation files are in GFF format. All files were further compressed using gzip. After downloading these files, you can use the command "gunzip *.gz" to uncompress these files.

<br><br>
# Nuclear Genomes

|---
|Species|Strain|Assembly|Annotation|CDSs|Proteome
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|S288c|[GENOME][1]|[GFF][2]|[CDS][3]|[PEP][4]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|DBVPG6044|[GENOME][5]|[GFF][6]|[CDS][7]|[PEP][8]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|DBVPG6765|[GENOME][9]|[GFF][10]|[CDS][11]|[PEP][12]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|SK1|[GENOME][13]|[GFF][14]|[CDS][15]|[PEP][16]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|Y12|[GENOME][17]|[GFF][18]|[CDS][19]|[PEP][20]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|YPS128|[GENOME][21]|[GFF][22]|[CDS][23]|[PEP][24]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|UWOPS03-461.4|[GENOME][25]|[GFF][26]|[CDS][27]|[PEP][28]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|CBS432|[GENOME][29]|[GFF][30]|[CDS][31]|[PEP][32]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|N44|[GENOME][33]|[GFF][34]|[CDS][35]|[PEP][36]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|YPS138|[GENOME][37]|[GFF][38]|[CDS][39]|[PEP][40]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|UFRJ50816|[GENOME][41]|[GFF][42]|[CDS][43]|[PEP][44]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|UWOPS91-917.1|[GENOME][45]|[GFF][46]|[CDS][47]|[PEP][48]
|---

<br><br>

# Mitochondrial Genomes

|---
|Species|Strain|Assembly|Annotation|CDSs|Proteome
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|S288c|[GENOME][49]|[GFF][50]|[CDS][51]|[PEP][52]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|DBVPG6044|[GENOME][53]|[GFF][54]|[CDS][55]|[PEP][56]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|DBVPG6765|[GENOME][57]|[GFF][58]|[CDS][59]|[PEP][60]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|SK1|[GENOME][61]|[GFF][62]|[CDS][63]|[PEP][64]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|Y12|[GENOME][65]|[GFF][66]|[CDS][67]|[PEP][68]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|YPS128|[GENOME][69]|[GFF][70]|[CDS][71]|[PEP][72]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|UWOPS03-461.4|[GENOME][73]|[GFF][74]|[CDS][75]|[PEP][76]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|CBS432|[GENOME][77]|[GFF][78]|[CDS][79]|[PEP][80]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|N44|[GENOME][81]|[GFF][82]|[CDS][83]|[PEP][84]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|YPS138|[GENOME][85]|[GFF][86]|[CDS][87]|[PEP][88]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|UFRJ50816|[GENOME][89]|[GFF][90]|[CDS][91]|[PEP][92]
|:-:|:-:|:-:|:-:|:-:|:-:
|*S.c.*|UWOPS91-917.1|[GENOME][93]|[GFF][94]|[CDS][95]|[PEP][96]
|---


[1]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_Genome/S288c.genome.fa.gz
[2]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_GFF/S288c.all_feature.gff.gz
[3]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_CDS/S288c.cds.fa.gz
[4]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_PEP/S288c.pep.fa.gz
[5]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_Genome/DBVPG6044.genome.fa.gz
[6]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_GFF/DBVPG6044.all_feature.gff.gz
[7]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_CDS/DBVPG6044.cds.fa.gz
[8]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_PEP/DBVPG6044.pep.fa.gz
[9]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_Genome/DBVPG6765.genome.fa.gz
[10]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_GFF/DBVPG6765.all_feature.gff.gz
[11]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_CDS/DBVPG6765.cds.fa.gz
[12]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_PEP/DBVPG6765.pep.fa.gz
[13]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_Genome/SK1.genome.fa.gz
[14]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_GFF/SK1.all_feature.gff.gz
[15]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_CDS/SK1.cds.fa.gz
[16]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_PEP/SK1.pep.fa.gz
[17]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_Genome/Y12.genome.fa.gz
[18]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_GFF/Y12.all_feature.gff.gz
[19]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_CDS/Y12.cds.fa.gz
[20]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_PEP/Y12.pep.fa.gz
[21]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_Genome/YPS128.genome.fa.gz
[22]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_GFF/YPS128.all_feature.gff.gz
[23]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_CDS/YPS128.cds.fa.gz
[24]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_PEP/YPS128.pep.fa.gz
[25]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_Genome/UWOPS03-461.4.genome.fa.gz
[26]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_GFF/UWOPS03-461.4.all_feature.gff.gz
[27]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_CDS/UWOPS03-461.4.cds.fa.gz
[28]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_PEP/UWOPS03-461.4.pep.fa.gz
[29]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_Genome/CBS432.genome.fa.gz
[30]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_GFF/CBS432.all_feature.gff.gz
[31]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_CDS/CBS432.cds.fa.gz
[32]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_PEP/CBS432.pep.fa.gz
[33]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_Genome/N44.genome.fa.gz
[34]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_GFF/N44.all_feature.gff.gz
[35]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_CDS/N44.cds.fa.gz
[36]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_PEP/N44.pep.fa.gz
[37]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_Genome/YPS138.genome.fa.gz
[38]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_GFF/YPS138.all_feature.gff.gz
[39]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_CDS/YPS138.cds.fa.gz
[40]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_PEP/YPS138.pep.fa.gz
[41]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_Genome/UFRJ50816.genome.fa.gz
[42]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_GFF/UFRJ50816.all_feature.gff.gz
[43]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_CDS/UFRJ50816.cds.fa.gz
[44]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_PEP/UFRJ50816.pep.fa.gz
[45]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_Genome/UWOPS919171.genome.fa.gz
[46]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_GFF/UWOPS919171.all_feature.gff.gz
[47]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_CDS/UWOPS919171.cds.fa.gz
[48]: {{ site.url }}{{ site.baseurl }}/data/Nuclear_PEP/UWOPS919171.pep.fa.gz
[49]: {{ site.url }}{{ site.baseurl }}/data/Mito_Genome/S288c.genome.fa.gz
[50]: {{ site.url }}{{ site.baseurl }}/data/Mito_GFF/S288c.all_feature.gff.gz
[51]: {{ site.url }}{{ site.baseurl }}/data/Mito_CDS/S288c.cds.fa.gz
[52]: {{ site.url }}{{ site.baseurl }}/data/Mito_PEP/S288c.pep.fa.gz
[53]: {{ site.url }}{{ site.baseurl }}/data/Mito_Genome/DBVPG6044.genome.fa.gz
[54]: {{ site.url }}{{ site.baseurl }}/data/Mito_GFF/DBVPG6044.all_feature.gff.gz
[55]: {{ site.url }}{{ site.baseurl }}/data/Mito_CDS/DBVPG6044.cds.fa.gz
[56]: {{ site.url }}{{ site.baseurl }}/data/Mito_PEP/DBVPG6044.pep.fa.gz
[57]: {{ site.url }}{{ site.baseurl }}/data/Mito_Genome/DBVPG6765.genome.fa.gz
[58]: {{ site.url }}{{ site.baseurl }}/data/Mito_GFF/DBVPG6765.all_feature.gff.gz
[59]: {{ site.url }}{{ site.baseurl }}/data/Mito_CDS/DBVPG6765.cds.fa.gz
[60]: {{ site.url }}{{ site.baseurl }}/data/Mito_PEP/DBVPG6765.pep.fa.gz
[61]: {{ site.url }}{{ site.baseurl }}/data/Mito_Genome/SK1.genome.fa.gz
[62]: {{ site.url }}{{ site.baseurl }}/data/Mito_GFF/SK1.all_feature.gff.gz
[63]: {{ site.url }}{{ site.baseurl }}/data/Mito_CDS/SK1.cds.fa.gz
[64]: {{ site.url }}{{ site.baseurl }}/data/Mito_PEP/SK1.pep.fa.gz
[65]: {{ site.url }}{{ site.baseurl }}/data/Mito_Genome/Y12.genome.fa.gz
[66]: {{ site.url }}{{ site.baseurl }}/data/Mito_GFF/Y12.all_feature.gff.gz
[67]: {{ site.url }}{{ site.baseurl }}/data/Mito_CDS/Y12.cds.fa.gz
[68]: {{ site.url }}{{ site.baseurl }}/data/Mito_PEP/Y12.pep.fa.gz
[69]: {{ site.url }}{{ site.baseurl }}/data/Mito_Genome/YPS128.genome.fa.gz
[70]: {{ site.url }}{{ site.baseurl }}/data/Mito_GFF/YPS128.all_feature.gff.gz
[71]: {{ site.url }}{{ site.baseurl }}/data/Mito_CDS/YPS128.cds.fa.gz
[72]: {{ site.url }}{{ site.baseurl }}/data/Mito_PEP/YPS128.pep.fa.gz
[73]: {{ site.url }}{{ site.baseurl }}/data/Mito_Genome/UWOPS03-461.4.genome.fa.gz
[74]: {{ site.url }}{{ site.baseurl }}/data/Mito_GFF/UWOPS03-461.4.all_feature.gff.gz
[75]: {{ site.url }}{{ site.baseurl }}/data/Mito_CDS/UWOPS03-461.4.cds.fa.gz
[76]: {{ site.url }}{{ site.baseurl }}/data/Mito_PEP/UWOPS03-461.4.pep.fa.gz
[77]: {{ site.url }}{{ site.baseurl }}/data/Mito_Genome/CBS432.genome.fa.gz
[78]: {{ site.url }}{{ site.baseurl }}/data/Mito_GFF/CBS432.all_feature.gff.gz
[79]: {{ site.url }}{{ site.baseurl }}/data/Mito_CDS/CBS432.cds.fa.gz
[80]: {{ site.url }}{{ site.baseurl }}/data/Mito_PEP/CBS432.pep.fa.gz
[81]: {{ site.url }}{{ site.baseurl }}/data/Mito_Genome/N44.genome.fa.gz
[82]: {{ site.url }}{{ site.baseurl }}/data/Mito_GFF/N44.all_feature.gff.gz
[83]: {{ site.url }}{{ site.baseurl }}/data/Mito_CDS/N44.cds.fa.gz
[84]: {{ site.url }}{{ site.baseurl }}/data/Mito_PEP/N44.pep.fa.gz
[85]: {{ site.url }}{{ site.baseurl }}/data/Mito_Genome/YPS138.genome.fa.gz
[86]: {{ site.url }}{{ site.baseurl }}/data/Mito_GFF/YPS138.all_feature.gff.gz
[87]: {{ site.url }}{{ site.baseurl }}/data/Mito_CDS/YPS138.cds.fa.gz
[88]: {{ site.url }}{{ site.baseurl }}/data/Mito_PEP/YPS138.pep.fa.gz
[89]: {{ site.url }}{{ site.baseurl }}/data/Mito_Genome/UFRJ50816.genome.fa.gz
[90]: {{ site.url }}{{ site.baseurl }}/data/Mito_GFF/UFRJ50816.all_feature.gff.gz
[91]: {{ site.url }}{{ site.baseurl }}/data/Mito_CDS/UFRJ50816.cds.fa.gz
[92]: {{ site.url }}{{ site.baseurl }}/data/Mito_PEP/UFRJ50816.pep.fa.gz
[93]: {{ site.url }}{{ site.baseurl }}/data/Mito_Genome/UWOPS919171.genome.fa.gz
[94]: {{ site.url }}{{ site.baseurl }}/data/Mito_GFF/UWOPS919171.all_feature.gff.gz
[95]: {{ site.url }}{{ site.baseurl }}/data/Mito_CDS/UWOPS919171.cds.fa.gz
[96]: {{ site.url }}{{ site.baseurl }}/data/Mito_PEP/UWOPS919171.pep.fa.gz

