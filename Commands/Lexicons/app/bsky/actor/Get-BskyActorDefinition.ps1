function Get-BskyActorDefinition {
[Alias('bsky.actor.defs','app.bsky.actor.defs','app.bsky.actor.defs#profileViewBasic','app.bsky.actor.defs#profileView','app.bsky.actor.defs#profileViewDetailed','app.bsky.actor.defs#viewerState','app.bsky.actor.defs#preferences','app.bsky.actor.defs#adultContentPref','app.bsky.actor.defs#contentLabelPref','app.bsky.actor.defs#savedFeedsPref','app.bsky.actor.defs#personalDetailsPref','app.bsky.actor.defs#feedViewPref','app.bsky.actor.defs#threadViewPref')]
param(
)
$lexiconText = @'
{
  "lexicon": 1,
  "id": "app.bsky.actor.defs",
  "description": "A reference to an actor in the network.",
  "defs": {
    "profileViewBasic": {
      "type": "object",
      "required": ["did", "handle"],
      "properties": {
        "did": { "type": "string", "format": "did" },
        "handle": { "type": "string", "format": "handle" },
        "displayName": {
          "type": "string",
          "maxGraphemes": 64,
          "maxLength": 640
        },
        "avatar": { "type": "string" },
        "viewer": { "type": "ref", "ref": "#viewerState" },
        "labels": {
          "type": "array",
          "items": { "type": "ref", "ref": "com.atproto.label.defs#label" }
        }
      }
    },
    "profileView": {
      "type": "object",
      "required": ["did", "handle"],
      "properties": {
        "did": { "type": "string", "format": "did" },
        "handle": { "type": "string", "format": "handle" },
        "displayName": {
          "type": "string",
          "maxGraphemes": 64,
          "maxLength": 640
        },
        "description": {
          "type": "string",
          "maxGraphemes": 256,
          "maxLength": 2560
        },
        "avatar": { "type": "string" },
        "indexedAt": { "type": "string", "format": "datetime" },
        "viewer": { "type": "ref", "ref": "#viewerState" },
        "labels": {
          "type": "array",
          "items": { "type": "ref", "ref": "com.atproto.label.defs#label" }
        }
      }
    },
    "profileViewDetailed": {
      "type": "object",
      "required": ["did", "handle"],
      "properties": {
        "did": { "type": "string", "format": "did" },
        "handle": { "type": "string", "format": "handle" },
        "displayName": {
          "type": "string",
          "maxGraphemes": 64,
          "maxLength": 640
        },
        "description": {
          "type": "string",
          "maxGraphemes": 256,
          "maxLength": 2560
        },
        "avatar": { "type": "string" },
        "banner": { "type": "string" },
        "followersCount": { "type": "integer" },
        "followsCount": { "type": "integer" },
        "postsCount": { "type": "integer" },
        "indexedAt": { "type": "string", "format": "datetime" },
        "viewer": { "type": "ref", "ref": "#viewerState" },
        "labels": {
          "type": "array",
          "items": { "type": "ref", "ref": "com.atproto.label.defs#label" }
        }
      }
    },
    "viewerState": {
      "type": "object",
      "properties": {
        "muted": { "type": "boolean" },
        "mutedByList": {
          "type": "ref",
          "ref": "app.bsky.graph.defs#listViewBasic"
        },
        "blockedBy": { "type": "boolean" },
        "blocking": { "type": "string", "format": "at-uri" },
        "following": { "type": "string", "format": "at-uri" },
        "followedBy": { "type": "string", "format": "at-uri" }
      }
    },
    "preferences": {
      "type": "array",
      "items": {
        "type": "union",
        "refs": [
          "#adultContentPref",
          "#contentLabelPref",
          "#savedFeedsPref",
          "#personalDetailsPref",
          "#feedViewPref",
          "#threadViewPref"
        ]
      }
    },
    "adultContentPref": {
      "type": "object",
      "required": ["enabled"],
      "properties": {
        "enabled": { "type": "boolean", "default": false }
      }
    },
    "contentLabelPref": {
      "type": "object",
      "required": ["label", "visibility"],
      "properties": {
        "label": { "type": "string" },
        "visibility": {
          "type": "string",
          "knownValues": ["show", "warn", "hide"]
        }
      }
    },
    "savedFeedsPref": {
      "type": "object",
      "required": ["pinned", "saved"],
      "properties": {
        "pinned": {
          "type": "array",
          "items": {
            "type": "string",
            "format": "at-uri"
          }
        },
        "saved": {
          "type": "array",
          "items": {
            "type": "string",
            "format": "at-uri"
          }
        }
      }
    },
    "personalDetailsPref": {
      "type": "object",
      "properties": {
        "birthDate": {
          "type": "string",
          "format": "datetime",
          "description": "The birth date of the owner of the account."
        }
      }
    },
    "feedViewPref": {
      "type": "object",
      "required": ["feed"],
      "properties": {
        "feed": {
          "type": "string",
          "description": "The URI of the feed, or an identifier which describes the feed."
        },
        "hideReplies": {
          "type": "boolean",
          "description": "Hide replies in the feed."
        },
        "hideRepliesByUnfollowed": {
          "type": "boolean",
          "description": "Hide replies in the feed if they are not by followed users."
        },
        "hideRepliesByLikeCount": {
          "type": "integer",
          "description": "Hide replies in the feed if they do not have this number of likes."
        },
        "hideReposts": {
          "type": "boolean",
          "description": "Hide reposts in the feed."
        },
        "hideQuotePosts": {
          "type": "boolean",
          "description": "Hide quote posts in the feed."
        }
      }
    },
    "threadViewPref": {
      "type": "object",
      "properties": {
        "sort": {
          "type": "string",
          "description": "Sorting mode.",
          "knownValues": ["oldest", "newest", "most-likes", "random"]
        },
        "prioritizeFollowedUsers": {
          "type": "boolean",
          "description": "Show followed users at the top of all replies."
        }
      }
    }
  }
}
'@
$lexicon = $lexiconText | ConvertFrom-JSON
if ($myInvocation.InvocationName -eq $myInvocation.MyCommand.Name) {
    $lexicon
} elseif ($myInvocation.InvocationName -like '*#*') {
    $lexicon.defs.$(@($myInvocation.InvocationName -split '\#',2)[1])
} else {
    $lexicon
}
} 

