<?php

namespace App\Service;
use Dompdf\Dompdf;
use Dompdf\Options;
use Symfony\Component\HttpFoundation\Response;
use Twig\Environment;

class GeneratePDFService{

    private $twig;

    public function __construct(Environment $twig){
        $this->twig = $twig;
    }

    public function renderPDF($template,$params,$filename): Response{
        // On définit les options du PDF
        $pdfOptions = new Options();
        // Police par défaut
        $pdfOptions->set('defaultFont', 'Arial');
        // On instancie Dompdf
        $dompdf = new Dompdf($pdfOptions);
        // Pour SSL 
        // $context = stream_context_create([
        //     'ssl' => [
        //         'verify_peer' => FALSE,
        //         'verify_peer_name' => FALSE,
        //         'allow_self_signed' => TRUE
        //     ]
        // ]);
        // $dompdf->setHttpContext($context);        
        // On génère le html
        $html = $this->twig->render($template,$params);
        $dompdf->loadHtml($html);
        $dompdf->setPaper('A4', 'portrait');
        $dompdf->render();
        // On génère un nom de fichier
        $fichier = $filename;
        // On envoie le PDF au navigateur
        $dompdf->stream($fichier, [
            'Attachment' => true
        ]);
        return new Response();
    }
}