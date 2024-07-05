name: Compile LaTeX Document

on:
  push:
    branches:
      - '**'
  pull_request:
    branches:
      - '**'
  workflow_dispatch:

  
jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v2

    - name: Set up LaTeX environment
      uses: dante-ev/latex-action@latest

    - name: Install dependencies
      run: |
        sudo apt-get update
        sudo apt-get install -y make

    - name: Execute Makefile
      run: make

    - name: Upload PDFs
      uses: actions/upload-artifact@v2
      with:
        name: compiled-documents
        path: Compiled/*.pdf
