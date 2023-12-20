from Bio.Seq import Seq
from Bio.SeqUtils import gc_fraction
from Bio import SeqIO
import pandas as pd

fasta_file = "path/spades/spades_output_Pool_1/scaffolds_above_500_pep_converted.fasta"

for record in SeqIO.parse(fasta_file, "fasta"):
    seq_id = record.id
    sequence = record.seq
    print(f"> {seq_id}")
    print(sequence)
    print(len(sequence))
    gc_content = gc_fraction(record)*100
    print(gc_content)
