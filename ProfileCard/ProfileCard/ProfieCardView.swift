//
//  ProfieCardView.swift
//  ProfileCard
//
//  Created by Praveen V on 16/06/26.
//

import SwiftUI

struct ProfileCardView: View {

    @State private var isFollowing = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                // MARK: - Avatar
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.indigo)
                    .padding(.top, 30)

                // MARK: - Name & Title
                VStack(spacing: 6) {
                    Text("Nick Jonas")
                        .font(.title)
                        .fontWeight(.bold)

                    Text("Senior Product Designer")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Text("Framer Inc.")
                        .font(.subheadline)
                        .foregroundColor(.indigo)

                    HStack(spacing: 4) {
                        Image(systemName: "mappin.and.ellipse")
                        Text("San Francisco, CA")
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.top, 2)
                }

                // MARK: - Action Buttons
                HStack(spacing: 12) {
                    Button(action: {
                        isFollowing.toggle()
                    }) {
                        Text(isFollowing ? "Following" : "Follow")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isFollowing ? Color.gray : Color.indigo)
                            .cornerRadius(12)
                    }

                    Button(action: {}) {
                        Text("Message")
                            .font(.headline)
                            .foregroundColor(.indigo)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal)

                Divider()

                // MARK: - Stats
                HStack {
                    StatView(value: "12.5K", label: "Followers")
                    Divider().frame(height: 40)
                    StatView(value: "318", label: "Following")
                    Divider().frame(height: 40)
                    StatView(value: "94", label: "Projects")
                }
                .padding(.horizontal)

                Divider()

                // MARK: - Bio
                VStack(alignment: .leading, spacing: 8) {
                    Text("About")
                        .font(.headline)

                    Text("Crafting delightful digital experiences at the intersection of design and engineering. Passionate about typography, motion, and systems thinking.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineSpacing(4)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

                // MARK: - Tags
                VStack(alignment: .leading, spacing: 10) {
                    Text("Expertise")
                        .font(.headline)

                    HStack(spacing: 8) {
                        ForEach(["UI/UX", "Branding", "Motion", "Systems"], id: \.self) { tag in
                            Text(tag)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.indigo)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.indigo.opacity(0.12))
                                .cornerRadius(20)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

                // MARK: - Social Links
                VStack(alignment: .leading, spacing: 10) {
                    Text("Connect")
                        .font(.headline)

                    SocialRow(icon: "link", label: "NickJonas.Musics", color: .indigo)
                    SocialRow(icon: "message.fill", label: "@iNickJonas", color: .teal)
                    SocialRow(icon: "envelope.fill", label: "Nick@bands.com", color: .orange)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

                Spacer()
            }
        }
        .background(Color(.systemBackground))
    }
}

// MARK: - Stat View

struct StatView: View {
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.title3)
                .fontWeight(.bold)
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Social Row

struct SocialRow: View {
    let icon: String
    let label: String
    let color: Color

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(color)
                .frame(width: 32, height: 32)
                .background(color.opacity(0.12))
                .cornerRadius(8)

            Text(label)
                .font(.subheadline)
                .foregroundColor(.primary)

            Spacer()

            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(12)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    ProfileCardView()
}
