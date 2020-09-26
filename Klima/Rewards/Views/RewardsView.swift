//
//  RewardsView.swift
//  Klima
//
//  Created by Marc Lennard Vlaminck on 26.09.20.
//

import SwiftUI

struct RewardsView: View {
    var body: some View {
        NavigationView {
            Group {
                ScrollView {
                        VStack {
                            HStack{
                                Text("Silke Haller")
                                    .bold()
                                Spacer()
                            }
                            .padding()
                            
                            HStack {
                                Spacer()
                                ProgressBar(co2Progress: .constant(0.85), pointProgress: .constant(0.75))
                                Spacer()
                            }
                            HStack {
                                Text("Noch 1 Woche")
                                    .foregroundColor(.orange)
                                Divider()
                                Text("51 kg CO₂ eingespart")
                                    .foregroundColor(.green)
                            }
                            Text("234 Klimapunkte")
                        }
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding()
                    
                    
                    VStack {
                        
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Spacer()
                                Text("KOSTENFREI")
                                    .font(.system(size: 12))
                                Text("1x Kaffee")
                                    .font(.system(size: 20))
                                
                                HStack {
                                    Text("10 Punkte")
                                        .padding(10)
                                }
                                .foregroundColor(.white)
                                .background(Color.gray.opacity(0.9))
                                .cornerRadius(10)
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                            Spacer()
                            Spacer()
                            Spacer()
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color.gray.opacity(0.9))
                                Image(systemName: "bag.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 40)
                                    .foregroundColor(.accentColor)
                            }
                            .clipShape(Circle())
                            .frame(width: 80)
                            Spacer()
                        }
                        .background(Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.6), Color.purple.opacity(0.2)]), startPoint: .leading, endPoint: .trailing)))
                        .cornerRadius(10)
                        .padding(.horizontal)
                      
                        //--------------
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Spacer()
                                Text("KOSTENFREI")
                                    .font(.system(size: 12))
                                Text("1x Kaffee")
                                    .font(.system(size: 20))
                                
                                HStack {
                                    Text("20 Punkte")
                                        .padding(10)
                                }
                                .foregroundColor(.white)
                                .background(Color.gray.opacity(0.9))
                                .cornerRadius(10)
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                            Spacer()
                            Spacer()
                            Spacer()
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color.gray.opacity(0.9))
                                Image(systemName: "tram.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 40)
                                    .foregroundColor(.accentColor)
                            }
                            .clipShape(Circle())
                            .frame(width: 80)
                            Spacer()
                        }
                        .background(Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.6), Color.green.opacity(0.2)]), startPoint: .leading, endPoint: .trailing)))
                        .cornerRadius(10)
                        .padding()
                        
                        //-----------
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Spacer()
                                Text("10% RABATT")
                                    .font(.system(size: 12))
                                Text("Fahrrad Reparatur")
                                    .font(.system(size: 20))
                                
                                HStack {
                                    Text("30 Punkte")
                                        .padding(10)
                                }
                                .foregroundColor(.white)
                                .background(Color.gray.opacity(0.9))
                                .cornerRadius(10)
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                            Spacer()
                            Spacer()
                            Spacer()
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color.gray.opacity(0.9))
                                Image(systemName: "bicycle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 40)
                                    .foregroundColor(.accentColor)
                            }
                            .clipShape(Circle())
                            .frame(width: 80)
                            Spacer()
                        }
                        .background(Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.6), Color.orange.opacity(0.2)]), startPoint: .leading, endPoint: .trailing)))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        
                    }
                    
                    
                }
                .navigationTitle("Belohnungen")
            }
        }
    }
}

struct RewardsView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsView()
            .environment(\.colorScheme, .dark)
    }
}
