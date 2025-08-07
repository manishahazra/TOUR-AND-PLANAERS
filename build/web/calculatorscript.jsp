let display = document.getElementById("display");

function append(value) {
  display.value += value;
}

function clearDisplay() {
  display.value = "";
}

function backspace() {
  display.value = display.value.slice(0, -1);
}

function calculate() {
  try {
    display.value = eval(display.value);
  } catch {
    display.value = "Error";
  }
}

// Keyboard support
document.addEventListener("keydown", (e) => {
  const key = e.key;
  if (
    (key >= "0" && key <= "9") ||
    "+-*/().".includes(key)
  ) {
    append(key);
  } else if (key === "Enter") {
    calculate();
  } else if (key === "Backspace") {
    backspace();
  } else if (key === "Escape") {
    clearDisplay();
  }
});

// Dark mode toggle
const toggleBtn = document.getElementById("toggleMode");
toggleBtn.addEventListener("click", () => {
  document.body.classList.toggle("dark-mode");
  toggleBtn.textContent = document.body.classList.contains("dark-mode") 
    ? "?? Light Mode" 
    : "? Dark Mode";
});
