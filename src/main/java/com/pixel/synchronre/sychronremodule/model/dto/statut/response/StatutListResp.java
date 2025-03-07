package com.pixel.synchronre.sychronremodule.model.dto.statut.response;

import com.pixel.synchronre.sharedmodule.enums.TypeStatut;
import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class StatutListResp
{
    private Long staId;
    private String staCode;
    private String staLibelle;
    private String staLibelleLong;
    private String staType;

    public StatutListResp(Long staId, String staCode, String staLibelle, String staLibelleLong, TypeStatut typeStatut) {
        this.staId = staId;
        this.staCode = staCode;
        this.staLibelle = staLibelle;
        this.staLibelleLong = staLibelleLong;
        this.staType =typeStatut==null ? "" : typeStatut.name();
    }
}
