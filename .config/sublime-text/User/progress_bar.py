import sublime
import sublime_plugin


BAR_WIDTH = 15
FILLED_CHAR = "█"
EMPTY_CHAR = "░"


class CursorProgressBar(sublime_plugin.EventListener):
    def update_status(self, view):
        if not view or not view.sel():
            return

        sel = view.sel()[0]
        row, _ = view.rowcol(sel.b)

        total_lines = view.rowcol(view.size())[0] + 1
        progress = row / max(1, total_lines - 1)

        percent = int(progress * 100)
        filled = int(progress * BAR_WIDTH)

        bar = (
            FILLED_CHAR * filled +
            EMPTY_CHAR * (BAR_WIDTH - filled)
        )

        status = (
            f"[{bar}] {percent}% • "
            f"Ln {row + 1}/{total_lines}"
        )

        view.set_status("cursor_progress", status)

    def on_selection_modified_async(self, view):
        self.update_status(view)

    def on_activated_async(self, view):
        self.update_status(view)

    def on_modified_async(self, view):
        self.update_status(view)
