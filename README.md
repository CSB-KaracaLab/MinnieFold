
<img src="logo.png" alt="MinnieFold Logo" width="400"/>

A computationally ⚡ **efficient** ⚡ and 🌱 **green** 🌱 alternative for antibody-antigen complex modeling.
**MinnieFold** significantly reduces GPU hours while maintaining model accuracy, making it an accessible and sustainable solution for protein complex prediction.

Inspired by Wallner's AFsample approach and Raouraoua et al., MassiveFold.

## 🔬 Research Background

MinnieFold was developed and tested during the CAPRI 55 competition, where it successfully modeled antibody-antigen complexes with reduced computational costs. Key findings and methodologies are detailed in our publication:

**"Towards a greener AlphaFold2 protocol for antibody-antigen complex modeling: Insights from CAPRI Round 55"**  
Authors: Büşra Savaş, İrem Yılmazbilek, Atakan Özsan, Ezgi Karaca

📄 [Read the full paper](https://www.biorxiv.org/content/10.1101/2024.10.07.616947v1.abstract)  

## 📂 Folder Structure
```bash
MinnieFold/
├── example/                       # Example input and job scripts for MinnieFold
│   ├── input/                     # Input FASTA files (e.g., trial.fasta)
│   ├── results/                   # Results generated for each scenario
│   ├── scenarios/                 # Scenario-specific scripts
│   ├── minniefold-sequential.sh   # Main script to run MinnieFold sequentially
├── data/                          # Paper-related data and analysis
│   ├── models/                    # CAPRI55 models
│       ├── TXXX/                  # Target folders (T231, T232, T233, T234)
│           ├── SX/                # Scenario-specific models for each target
│       ├── AF3-models/            # AlphaFold3-generated models
│       ├── Post-MinnieFold/       # Refined and rescored structures for T231 and T233
│   ├── analysis/                  # Post-analysis files 
│       ├── TXXX/                  # Target folders (T231, T232, T233, T234)
│           ├── cdr-plddt/         # Confidence scores for CDR regions (T231 only)
│           ├── cdr-rmsd/          # RMSD calculations for CDR regions
│           ├── dockq/             # DockQ score evaluations
│           ├── foldx-ene/         # FoldX interface energy calculations
│           ├── rmsd/              # RMSD calculations (T232 only)
├── logo.png                       # MinnieFold Logo
└── README.md                      # Main documentation file
```

## 🚀 Usage

### Prerequisites
1. Ensure you have the required dependencies installed (e.g., Bash, required system tools).
2. Install [Local ColabFold](https://github.com/YoshitakaMo/localcolabfold).
3. Clone this repository:
   ```bash
   git clone https://github.com/CSB-KaracaLab/MinnieFold.git
   cd MinnieFold/
    ```

### Running MinnieFold
**Set up your scenarios as you wish**: Ensure that each scenario script (s1.sh, s2.sh, ..) is located in the scenarios directory.

**Execute the MinnieFold scrip**t: Use the minniefold-sequential.sh script to run all scenarios sequentially for a given job name. Replace <JobName> with a name of your fasta (without extension) to organize results.
```bash
cd example/
 ./minniefold-sequential.sh <JobName>
```
**What the script does**: 
- Runs all scenarios sequentially.
- Creates a directory structure under results/ to store output files for each scenario.
- Saves log file of each scenario in the corresponding subdirectory (e.g., results/<JobName>/s1/s1.log).

**Example usage**: To run MinnieFold for trial.fasta located under input directory:
```bash
 ./minniefold-sequential.sh trial
```

## Acknowledgements

This research is supported by EMBO Grant Installation under the 4421 support program.

## 📧 Contact

For questions or feedback, contact the corresponding author:

**Ezgi Karaca**  
📩 [ezgi.karaca@ibg.edu.tr](mailto:ezgi.karaca@ibg.edu.tr)


