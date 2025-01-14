{
  plugins.mkdnflow = {
    enable = true;
    mappings = {
      MkdnCreateLink = false;
      MkdnCreateLinkFromClipboard = false;
      MkdnDecreaseHeading = false;
      MkdnDestroyLink = false;
      # MkdnEnter = false;
      MkdnExtendList = false;
      MkdnFoldSection = false;
      MkdnFollowLink = false;
      # MkdnGoBack = false;
      # MkdnGoForward = false;
      MkdnIncreaseHeading = false;
      MkdnMoveSource = false;
      MkdnNewListItem = false;
      # MkdnNewListItemAboveInsert = false;
      # MkdnNewListItemBelowInsert = false;
      MkdnNextHeading = false;
      MkdnNextLink = false;
      MkdnPrevHeading = false;
      MkdnPrevLink = false;
      MkdnSTab = false;
      MkdnTab = false;
      MkdnTableFormat = {
        key = "<Leader>ft";
        modes = ["n"];
      };
      MkdnTableNewColAfter = false;
      MkdnTableNewColBefore = false;
      MkdnTableNewRowAbove = false;
      MkdnTableNewRowBelow = false;
      MkdnTableNextCell = false;
      MkdnTableNextRow = false;
      MkdnTablePrevCell = false;
      MkdnTablePrevRow = false;
      # MkdnToggleToDo = false;
      MkdnUnfoldSection = false;
      MkdnUpdateNumbering = false;
      MkdnYankAnchorLink = false;
      MkdnYankFileAnchorLink = false;
    };
    perspective.priority = "current";
    toDo.symbols = [" " "x"];
  };
}
