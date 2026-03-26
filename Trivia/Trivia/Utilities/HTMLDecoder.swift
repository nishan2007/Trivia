//
//  HTMLDecoder.swift
//  Trivia
//
//  Created by Nishan Narain on 3/24/26.
//

import Foundation

func decodeHTML(_ text: String) -> String {
    var decoded = text

    let htmlEntities: [String: String] = [
        "&quot;": "\"",
        "&#039;": "'",
        "&apos;": "'",
        "&amp;": "&",
        "&lt;": "<",
        "&gt;": ">",
        "&eacute;": "é",
        "&uuml;": "ü",
        "&rsquo;": "’",
        "&ldquo;": "“",
        "&rdquo;": "”",
        "&ndash;": "–",
        "&mdash;": "—",
        "&hellip;": "…"
    ]

    for (entity, replacement) in htmlEntities {
        decoded = decoded.replacingOccurrences(of: entity, with: replacement)
    }

    return decoded
}
