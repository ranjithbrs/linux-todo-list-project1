# 📝 Linux CLI To-Do List Manager

[![Shell: Bash](https://img.shields.io/badge/Shell-GNU%20Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Environment: Linux / POSIX](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20WSL-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://www.kernel.org/)
[![Tool: Sed & NL](https://img.shields.io/badge/Coreutils-sed%20%2B%20nl-blue?style=for-the-badge)](todo.sh)
[![License: MIT](https://img.shields.io/badge/License-MIT-purple?style=for-the-badge)](LICENSE)

> A lightweight, persistent command-line task management utility engineered with Unix/Linux shell scripting. Utilizes core POSIX utilities (`sed`, `nl`, shell parameter expansion) to deliver fast task logging, indexing, and deletion.

---

## 📑 Table of Contents
- [Architecture & Command Flowchart](#-architecture--command-flowchart)
- [Command Reference](#-command-reference)
- [Getting Started & Installation](#-getting-started--installation)
- [Example Terminal Session](#-example-terminal-session)
- [Internal Implementation Details](#-internal-implementation-details)
- [Author & Connect](#-author)
- [License](#-license)

---

## 📐 Architecture & Command Flowchart

```mermaid
flowchart TD
    subgraph CLI["🖥️ Command-Line Invocation"]
        A[./todo.sh $1 $2] --> B{Parse Command: $1}
    end

    subgraph CommandRouter["⚙️ Case Router & POSIX Execution"]
        B -->|add| C[Append Task String to tasks.txt: echo >> FILE]
        B -->|list| D[Numbered Output via nl -w2 -s'. ']
        B -->|delete| E[In-Place Line Deletion via sed -i '${line}d']
        B -->|* or empty| F[Display Syntax Usage Help]
    end

    subgraph Storage["📁 Flat-File Persistence"]
        C --> G[(tasks.txt)]
        D -.-> G
        E --> G
    end

    subgraph Output["📊 Terminal Feedback"]
        C --> H[Print: Task added: '{task}']
        D --> I[Display Formatted Task List]
        E --> J[Print: Task {n} deleted]
        F --> K[Print: Usage: ./todo.sh {add|list|delete} [task]]
    end
```

---

## 📋 Command Reference

| Command | Arguments | Description | Example Syntax |
| :--- | :--- | :--- | :--- |
| `add` | `"<task_description>"` | Appends a new task string to `tasks.txt` | `./todo.sh add "Prepare for Java Viva"` |
| `list` | *None* | Formats and prints all recorded tasks with line indices | `./todo.sh list` |
| `delete` | `<task_number>` | Deletes the task at the specified numerical line number | `./todo.sh delete 2` |
| `*` | *Any / None* | Prints parameter usage instructions | `./todo.sh help` |

---

## 🚀 Getting Started & Installation

### Prerequisites
- Any Unix/Linux operating system, macOS, or Windows Subsystem for Linux (WSL) / Git Bash with GNU Bash installed.

### 1. Clone the Repository
```bash
git clone https://github.com/ranjithbrs/linux-todo-list-project1.git
cd linux-todo-list-project1
```

### 2. Grant Execute Permissions
```bash
chmod +x todo.sh
```

---

## 💻 Example Terminal Session

```bash
# 1. Add new tasks
$ ./todo.sh add "Complete Spring Boot attendance module"
Task added: Complete Spring Boot attendance module

$ ./todo.sh add "Review DSA Tree Traversal problems"
Task added: Review DSA Tree Traversal problems

$ ./todo.sh add "Update portfolio resume.pdf"
Task added: Update portfolio resume.pdf

# 2. View current task list
$ ./todo.sh list
 1. Complete Spring Boot attendance module
 2. Review DSA Tree Traversal problems
 3. Update portfolio resume.pdf

# 3. Delete completed task
$ ./todo.sh delete 2
Task 2 deleted

# 4. View updated task list
$ ./todo.sh list
 1. Complete Spring Boot attendance module
 2. Update portfolio resume.pdf
```

---

## 🔍 Internal Implementation Details

- **File Stream Redirection (`>>`)**: Guarantees atomic non-destructive appending of tasks to the text buffer.
- **GNU Number Lines (`nl`)**: Formats tasks cleanly using two-digit width padding (`-w2`) and custom separators (`-s'. '`).
- **Stream Editor (`sed -i`)**: Executes in-place deletion directly on `tasks.txt` without requiring secondary temporary files or manual buffering.

---

## 👨‍💻 Author

**Ranjith B**  
🎓 *B.Tech Computer Science & Business Systems (CSBS)*  
🏛️ *Nehru Institute of Engineering and Technology, Coimbatore*  

- 💼 **LinkedIn**: [linkedin.com/in/ranjith-b-85907831a](https://linkedin.com/in/ranjith-b-85907831a)  
- 🐙 **GitHub**: [github.com/ranjithbrs](https://github.com/ranjithbrs)  
- 🌐 **Portfolio**: [ranjithbrs.github.io/portfolio](https://ranjithbrs.github.io/portfolio/)  
- 📧 **Email**: ranjithb2k06@gmail.com  

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
