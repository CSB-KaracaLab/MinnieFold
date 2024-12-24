import csv
import argparse
from Bio.PDB import PDBParser

def calculate_average_plddt(pdb_file, regions):
    # Parse the PDB file
    parser = PDBParser(QUIET=True)
    structure = parser.get_structure("structure", pdb_file)
    
    results = {}
    for region_name, (chain_id, res_range) in regions.items():
        chain = structure[0][chain_id]
        residues = [res for res in chain if res.get_id()[1] in range(res_range[0], res_range[1] + 1)]
        
        # Extract pLDDT values from B-factor field
        plddt_values = [atom.bfactor for res in residues for atom in res if atom.bfactor > 0]

        if plddt_values:
            average_plddt = sum(plddt_values) / len(plddt_values)
        else:
            average_plddt = 0  # Handle regions with no valid pLDDT scores
        
        results[region_name] = average_plddt
    
    return results

def write_to_csv(output_file, pdb_file, results):
    # Append results to the CSV file
    with open(output_file, mode='a', newline='') as csvfile:
        fieldnames = ['PDB_File'] + list(results.keys())
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        
        # Write headers if the file is empty
        if csvfile.tell() == 0:
            writer.writeheader()
        
        # Write the results
        row = {'PDB_File': pdb_file}
        row.update(results)
        writer.writerow(row)

def main():
    # Parse command-line arguments
    parser = argparse.ArgumentParser(description="Calculate average pLDDT values for specified regions in a PDB file.")
    parser.add_argument("pdb_file", type=str, help="Path to the input PDB file")
    parser.add_argument("--output_csv", type=str, default="average_plddt.csv", help="Path to the output CSV file (default: average_plddt.csv)")
    args = parser.parse_args()
    
    # Define the regions
    regions = {
        "CDRH1": ("A", (26, 33)),
        "CDRH2": ("A", (51, 58)),
        "CDRH3": ("A", (97, 106)),
        "CDRL1": ("B", (27, 37)),
        "CDRL2": ("B", (55, 57)),
        "CDRL3": ("B", (94, 102)),
    }

    # Calculate average pLDDT for the specified regions
    average_plddt_results = calculate_average_plddt(args.pdb_file, regions)

    # Write the results to the CSV file
    write_to_csv(args.output_csv, args.pdb_file, average_plddt_results)
    
    print(f"Results for {args.pdb_file} written to {args.output_csv}")

if __name__ == "__main__":
    main()

