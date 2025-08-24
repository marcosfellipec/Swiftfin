//
// Swiftfin is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Factory
import Foundation
import JellyfinAPI

final class DownloadVideoPlayerManager: VideoPlayerManager {

    init(episode: DownloadedEpisode) {
        super.init()

        let downloadManager = Container.shared.downloadManager()
        guard let playbackURL = episode.mediaURL else {
            logger.error("episode does not have media url for item: \(episode.displayTitle)")

            return
        }

        self.currentViewModel = .init(
            playbackURL: playbackURL,
            item: episode.episodeItem,
            mediaSource: .init(),
            playSessionID: "",
            videoStreams: episode.episodeItem.videoStreams,
            audioStreams: episode.episodeItem.audioStreams,
            subtitleStreams: episode.episodeItem.subtitleStreams,
            selectedAudioStreamIndex: 1,
            selectedSubtitleStreamIndex: 1,
            chapters: episode.episodeItem.fullChapterInfo,
            playMethod: .directPlay
        )
    }

    override func getAdjacentEpisodes(for item: BaseItemDto) {}

    override func sendStartReport() {}

    override func sendPauseReport() {}

    override func sendStopReport() {}

    override func sendProgressReport() {}
}
