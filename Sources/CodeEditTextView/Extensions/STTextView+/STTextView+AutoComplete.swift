/* -----------------------------------------------------------
 * :: :  C  O  S  M  O  :                                   ::
 * -----------------------------------------------------------
 * @wabistudios :: cosmos :: realms
 *
 * CREDITS.
 *
 * T.Furby              @furby-tm       <devs@wabi.foundation>
 *
 *         Copyright (C) 2023 Wabi Animation Studios, Ltd. Co.
 *                                        All Rights Reserved.
 * -----------------------------------------------------------
 *  . x x x . o o o . x x x . : : : .    o  x  o    . : : : .
 * ----------------------------------------------------------- */

import AppKit
import STTextView

extension STTextView
{
  /// Corresponding closing brackets for given opening bracket.
  ///
  /// The following pairs are currently implemented:
  /// * `(` : `)`
  /// * `{` : `}`
  /// * `[` : `]`
  private var bracketPairs: [String: String]
  {
    [
      "(": ")",
      "{": "}",
      "[": "]",
      // not working yet
      //            "\"": "\"",
      //            "\'": "\'"
    ]
  }

  /// Add closing bracket and move curser back one symbol if applicable.
  /// - Parameter symbol: The symbol to check for
  func autocompleteBracketPairs(_ symbol: String)
  {
    guard let end = bracketPairs[symbol],
          nextSymbol() != end else { return }
    insertText(end, replacementRange: selectedRange())
    moveBackward(self)
  }

  /// Returns the symbol right of the cursor.
  private func nextSymbol() -> String
  {
    let start = selectedRange().location
    let nextRange = NSRange(location: start, length: 1)
    guard let nextSymbol = string[nextRange]
    else
    {
      return ""
    }
    return String(nextSymbol)
  }
}
