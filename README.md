# Modern Technique in Hadron Spectroscopy Summer School Material


This repository hosts the materials and exercise sheets for the "Modern Techniques in Hadron Spectroscopy" summer school,
aimed at training hadron physicists in theoretical and experimental methods related to major physics programs like LHC, BESIII, Belle, JLab, and FAIR.
Targeting both early-career and senior researchers, the content here is designed to enhance practical skills and theoretical understanding.
More details about the event can be found [here](https://indico.gsi.de/event/19202/).

The repository includes a LaTeX files, exercise collection, and a setup for easy compilation of problem sets and solutions.

## LaTeX Commands

The custom LaTeX class (`exercise.cls` authored by Will Davey) provides a variety of commands to streamline the creation of exercise sheets.
Here are some key commands:

- `\setsheetnumber{number}`: Set the current sheet number.
- `\setexdate{date}`: Set the date when the exercises are discussed.
- `\setduedate{date}`: Set the submission deadline for the exercises.
- `\makeheader`: Creates a standardized header for the exercise sheet.
- `\morning`: Marks the beginning of lecture material section.
- `\afternoon`: Marks the beginning of exercise exercises.
- `\importex{filename}{title}{points}`: Imports an exercise from the specified file, with a title and points allocation.

## Compilation Instructions

To compile an exercise sheet and its solutions, follow these steps:

1. Prepare the LaTeX file for the sheet, e.g., `sheet_X.tex`.
2. Use the Makefile provided in the repository:

```bash
make Compiled/sheet_X.pdf
make Compiled/sheet_X_sol.pdf
```

3. To clean up intermediate files:

```bash
rm workdir_sheet_X
```

## Using Visual Studio Code

For a smooth LaTeX editing experience, use Visual Studio Code (VS Code) with the LaTeX Workshop extension. This setup provides syntax highlighting, code completion, and build automation.

- Install the LaTeX Workshop extension from the VS Code Marketplace.
- Use the `.vscode` directory's configuration files to set up LaTeX Workshop to run `make` for building your documents.

## GitHub Actions for Automatic Compilation

This repository is configured with GitHub Actions to automatically compile LaTeX files into PDFs upon push. The resulting PDFs are not committed to the repository but can be downloaded from the Actions tab, ensuring a clean repository structure.

**Note:** Do not commit the compiled PDF files (`sheet_X.pdf` and `sheet_X_sol.pdf`) to the repository. Let the GitHub Actions handle the compilation and distribution of these files.

## Contribution and Issues

Contributors are welcome to enhance the LaTeX class, add new exercises, or improve the setup. For any issues or suggestions, please open an issue or pull request on GitHub.
